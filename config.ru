require 'bundler'
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'])

require 'steep_time'
run SteepTime::App
