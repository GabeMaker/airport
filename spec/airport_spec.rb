require 'airport'

describe Airport do
  
  let (:airport) { Airport.new }
  let (:plane)  { double :plane,  land: nil, take_off: nil } # is this 'nil' OK / convention - added to get past 'double received unexpected?
  let (:plane2) { double :plane2, land: nil, take_off: nil }

  context "Take off, landing and tracking planes" do

    it 'should have no planes landed on creation' do
      expect(airport.planes).to eq []
    end

    it 'should be able to tell a plane to land at it' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    it 'should know a plane has landed at it' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'should be able to tell a plane to take off from it' do
      airport.land(plane)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end

    it 'should know a plane has taken off from it' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'should be able to land two planes' do
      airport.land(plane)
      airport.land(plane2)
      expect(airport.planes).to eq [plane, plane2]
    end

    # is this test necessary? it passed immediately (though the take_off method was still wrong at this point)
    # are you only meant to write failing tests?
    # (the tests are listed in the order they were created)
    it 'should let two planes take off' do
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      airport.take_off(plane2)
      expect(airport.planes).to eq []
    end

    it 'should let a plane take_off while others stay landed' do
      airport.land plane
      airport.land plane2
      airport.take_off plane
      expect(airport.planes).to eq [plane2]
    end    

    it 'a plane cannot land if the airport is full' do
      10.times { airport.land(plane) }
      expect{airport.land(plane)}.to raise_error "planes can't land when airport is full"
    end

    it 'can be created with a custom capacity' do
      tiny_airport = Airport.new(1)
      tiny_airport.land(plane)
      expect{tiny_airport.land(plane)}.to raise_error "planes can't land when airport is full"
    end



  end

  context "Weather" do

  class Airport
    def helper_make_it(weather_condition)
      self.weather = weather_condition
    end
  end

    it 'should be stormy 20% of the time' do
    # do not know how to test this here - played with it in irb:
    # airport  = Airport.new
    # weathers = Array.new
    # 1000000.times { weathers << airport.set_weather_randomly}
    # weathers.count :stormy
    # => aprrox == 20000

    # we expect this test to fail about one in five times:
    # expect(airport.weather).to eq :sunny
    end

    it 'should not be possible for a plane to land when it is stormy' do
      airport.land(plane)
      airport.take_off(plane)
      airport.helper_make_it(:stormy)
      expect{airport.land(plane)}.to raise_error "planes can't land when it's stormy"      
    end
  
    it 'should not be possible for a plane to take off when it is stormy' do
      airport.land(plane)
      airport.helper_make_it(:stormy)
      expect{airport.take_off(plane)}.to raise_error "planes can't take off when it's stormy"
    end

  end

end  


  ## working notes:

  ## plane should not be able to land at more than one airport    

  ## 'should not be able to tell a non flying plane to land'
  ## this should probably be the responsibility of the plane:
  ## e.g. 'should not be able to land if not flying'

  ## should not be able to tell anything to a plane not at the airport 
