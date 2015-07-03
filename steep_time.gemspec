# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steep_time/version'

Gem::Specification.new do |spec|
  spec.name           = 'steep_time'
  spec.version        = SteepTime::VERSION
  spec.authors        = ['Chris Warren']
  spec.email          = ['cwarren13@gmail.com']
  spec.summary        = 'Manages nictoine juice steeping.'
  spec.description    = 'This application manages nicotine juice steeping'
  spec.homepage       = 'https://github.com/cwar/steep_time'

  spec.require_paths  = ['lib']

  # spec.add_dependency 'sinatra', '~> 1.4'
  # spec.add_dependency 'rack', '1.5.2'
  # spec.add_dependency 'sequel', '~> 4.23'
  # spec.add_dependency 'pg', '~> 0.18'
  # spec.add_dependency 'nokogiri', '~> 1.6'
  # spec.add_dependency 'job-integration-logger', '~> 0.1.0'

  # spec.add_development_dependency 'rack-test', '0.6'
  spec.add_development_dependency 'bundler', '~> 1.7'
  # spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  # spec.add_development_dependency 'guard', '~> 2.8'
  # spec.add_development_dependency 'guard-rspec', '~> 4.3'
  spec.add_development_dependency 'rspec-pride', '~> 3.1'
end
