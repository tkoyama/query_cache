# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'query_cache/version'

Gem::Specification.new do |spec|
  spec.name          = "query_cache"
  spec.version       = QueryCache::VERSION
  spec.authors       = ["Tobias Haagen Michaelsen"]
  spec.email         = ["tobias.michaelsen@karnovgroup.com"]

  spec.summary       = "Query cache middleware for custom ActiveRecord base classes."
  spec.homepage      = "https://github.com/karnov/query_cache"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 3.2"
  spec.add_dependency "rack"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
end
