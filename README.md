# QueryCache

Rack middleware to supply query cache for custom `ActiveRecord` base classes.

If you define an `ActiveRecord` base class with its own connection, it isn't cached by Rails' default `ActiveRecord::QueryCache` middleware. Use this gem to conveniently add caching by [adding a single line to `config/environments/production.rb`](#usage).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "query_cache"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install query_cache

## Usage

```ruby
config.middleware.insert_after ActiveRecord::QueryCache, QueryCache.for(MyBase)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/karnov/query_cache.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
