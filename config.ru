require 'rubygems'
require 'bundler'

Bundler.require(:default,ENV["RACK_ENV"])

require './onr_app'
run OnrApp