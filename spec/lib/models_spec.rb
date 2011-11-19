require 'spec_helper'
require 'pathname'

describe Point do

	specify do
		@p = Point.new
		@p.should respond_to :id, :lat, :lon, :ele, :time, :created_at
	end

	it "has method #to_s" do
		@p = Point.new
		@p.lat= 100
		@p.lon= 200
		@p.should respond_to :to_s
		@p.to_s.should == "(100.0,200.0)"
	end
end

describe Track do
	specify do
		@t = Track.new
		@t.should respond_to :id, :name, :created_at, :points
	end

	it "has #points" do
		@t = Track.new
		@t.should respond_to :points

		@p = Point.new
		@p.lat = 100
		@p.lon = 100
		@p.ele = 100

		@t.points << @p

		@t.points.size.should == 1
	end

	it "has method #from_gpx" do
		Track.should respond_to :from_gpx!
		@t = Track.from_gpx! IO.read(Pathname.pwd.join("spec","test_track.gpx"))
		@t.class.should == Track	
	end
end