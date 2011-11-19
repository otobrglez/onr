class Track
  	include DataMapper::Resource
	property :id, Serial
	property :raw, Text
	property :created_at, DateTime
end

Track.auto_upgrade!
