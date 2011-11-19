# By Oto Brglez - <oto.brglez@opalab.com> 
require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require 'pathname'

# DataMapper config
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite://'+Pathname.pwd.join("tmp","database.db"))
require "./lib/track"
DataMapper.finalize

class OnrApp < Sinatra::Base

	set :haml, :format => :html5

	get '/a.css' do scss :main; end

	get '/' do
		@tracks = Track.all
		haml :index
	end
end