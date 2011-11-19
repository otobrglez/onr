class Track
  	include DataMapper::Resource
  	
	property :id, Serial
	property :name, String
	property :created_at, DateTime

	has n, :points

	def to_s
		"#{self.name}"
	end

	def self.from_gpx! gpx, name=nil
		t = Track.new :name => name
		raw = gpx if gpx.is_a? String
		raw = IO.read(gpx) if gpx.is_a?(Tempfile) || gpx.is_a?(File)
		t
	end
end

class Point
	include DataMapper::Resource

	property :id, Serial
	property :lat, Float
	property :lon, Float
	property :ele, Float
	property :time, DateTime
	property :created_at, DateTime

	belongs_to :track

	def to_s
		"(#{self.lat},#{self.lon})"
	end
end

Track.auto_upgrade!
Point.auto_upgrade!
