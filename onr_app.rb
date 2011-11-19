# By Oto Brglez - <oto.brglez@opalab.com> 
require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require 'pathname'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite://'+Pathname.pwd.join("database.db"))

class Track
  	include DataMapper::Resource
	property :id, Serial
	property :raw, Text
	property :created_at, DateTime
end

# DataMapper.auto_migrate!
DataMapper.finalize
Track.auto_upgrade!

class OnrApp < Sinatra::Base

	set :haml, :format => :html5

	get '/a.css' do
		scss :main
	end

	get '/' do
		@tracks = Track.all
		haml :index
	end

	get '/env' do
		ENV["RACK_ENV"]
	end

end