
require 'sinatra/base'

class OnrApp < Sinatra::Base

	set :haml, :format => :html5

	get '/a.css' do
		scss :main
	end

	get '/' do
		haml :index
	end

end