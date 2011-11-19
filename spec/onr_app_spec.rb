require "spec_helper"

describe OnrApp do
	include Rack::Test::Methods

	def app
		@app ||= OnrApp.new
	end

	it "should respond to /" do
		get '/'
		last_response.should be_ok
	end

	it "should display /new " do
		get '/new'
		last_response.should be_ok
	end

end