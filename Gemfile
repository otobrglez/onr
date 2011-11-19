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
	gem 'dm-sqlite-adapter'
end

group :test do
	gem "rspec"
end