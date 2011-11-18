
require 'sinatra/base'

class OnrApp < Sinatra::Base

	set :haml, :format => :html5

	get '/' do
		haml :index
	end

end