source "http://rubygems.org"

gem 'sinatra'
gem 'haml'
gem 'thin'
gem 'sass'
gem 'datamapper'

group :production do
	gem 'pg'
	gem 'dm-postgres-adapter'
end

group :development do
	gem 'shotgun'
	gem 'dm-mysql-adapter'
	gem 'ruby-debug19', :require => 'ruby-debug'
	gem 'rack-test'
end

group :test do
	gem 'rspec'
	gem 'rack-test'
end