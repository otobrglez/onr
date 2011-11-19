#require 'rubygems'
#require 'bundler'
require 'sinatra'
require 'rack/test'
require 'haml'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

require File.join(File.dirname(__FILE__), '..', 'onr_app.rb')
