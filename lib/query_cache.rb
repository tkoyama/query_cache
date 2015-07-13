require "query_cache/version"
require "active_record"
require "rack/body_proxy"

# Usage example: (In config/environments/production.rb)
#
# config.middleware.insert_after ActiveRecord::QueryCache, QueryCache.for(MyBase)
#
# Original source:
# https://github.com/rails/rails/blob/4-2-stable/activerecord/lib/active_record/query_cache.rb
module QueryCache
  class Middleware
    cattr_accessor :base

    def initialize(app)
      @app = app
    end

    def call(env)
      connection = base.connection
      enabled = connection.query_cache_enabled
      connection_id = base.connection_id
      connection.enable_query_cache!

      response = @app.call(env)
      response[2] = Rack::BodyProxy.new(response[2]) do
        restore_query_cache_settings(connection_id, enabled)
      end

      response
    ensure
      restore_query_cache_settings(connection_id, enabled)
    end

    private

    def restore_query_cache_settings(connection_id, enabled)
      base.connection_id = connection_id
      base.connection.clear_query_cache
      base.connection.disable_query_cache! unless enabled
    end
  end

  def self.for(base)
    fail ArgumentError, "You supllied `nil' instead of a ActiveRecord::Base subclass" if base.nil?
    fail ArgumentError, "Must be subclass of ActiveRecord::Base" unless base <= ActiveRecord::Base
    Class.new(Middleware).tap { |c| c.base = base }
  end
end
