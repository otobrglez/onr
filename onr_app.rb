# By Oto Brglez - <oto.brglez@opalab.com> 
require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require 'pathname'

# DataMapper config
# DataMapper::Logger.new($stdout, :debug)
DataMapper::Property::Text.length(5000000)
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://onr_app@localhost/onr_app')

require "./lib/models"
DataMapper.finalize

class OnrApp < Sinatra::Base

	set :haml, :format => :html5

	get '/main.css' do scss :main; end

	get '/' do
		@tracks = Track.all
		haml :index
	end

	get '/new' do
		haml :new
	end

	post '/' do
		unless params[:raw] && (tmpfile = params[:raw][:tempfile]) && (name = params[:raw][:filename])
    		return haml(:new)
  		end

  		@track = Track.from_gpx! params[:raw][:tempfile], name
  		@track.save


  		#t= 2
  		#debugger
  		#t=3
  		redirect "/"
	end
end