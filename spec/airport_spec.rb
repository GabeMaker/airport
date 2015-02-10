require 'airport'
require 'plane'

describe Airport do
  
  let (:airport) { Airport.new }
  let (:plane)  { double :plane,  land: nil, take_off: nil } 
  let (:plane2) { double :plane2, land: nil, take_off: nil }

  context "Take off, landing and tracking planes" do

    before(:each) { allow(airport).to receive(:weather).and_return(:sunny) }

    it 'should have no planes landed on creation' do
      expect(airport.planes).to eq []
    end

    it 'should be able to tell a plane to land at it' do
      expect(plane).to receive(:land)
      airport.request_to_land(plane)
    end

    it 'should know a plane has landed at it' do
      airport.request_to_land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'should be able to tell a plane to take off from it' do
      airport.request_to_land(plane)
      expect(plane).to receive(:take_off)
      airport.request_to_take_off(plane)
    end

    it 'should know a plane has taken off from it' do
      airport.request_to_land(plane)
      airport.request_to_take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'should be able to land two planes' do
      airport.request_to_land(plane)
      airport.request_to_land(plane2)
      expect(airport.planes).to eq [plane, plane2]
    end

    it 'should let two planes take off' do
      airport.request_to_land(plane)
      airport.request_to_land(plane2)
      airport.request_to_take_off(plane)
      airport.request_to_take_off(plane2)
      expect(airport.planes).to be_empty
    end

    it 'should let a plane take_off while others stay landed' do
      airport.request_to_land plane
      airport.request_to_land plane2
      airport.request_to_take_off plane
      expect(airport.planes).to eq [plane2]
    end    

    it 'a plane cannot land if the airport is full' do
      10.times { airport.request_to_land(plane) }
      expect{airport.request_to_land(plane)}.to raise_error "planes can't land when airport is full"
    end

    it 'can be created with a custom capacity' do
      tiny_airport = Airport.new(1)
      allow(tiny_airport).to receive(:weather) { :sunny }
      tiny_airport.request_to_land(plane)
      expect{tiny_airport.request_to_land(plane)}.to raise_error "planes can't land when airport is full"
    end
  
  end

  context "Weather" do

    it 'should be stormy 20% of the time' do
      # tested in irb
    end

    it 'should not be possible for a plane to land when it is stormy' do
      allow(airport).to receive(:weather){:stormy}
      expect{airport.request_to_land(plane)}.to raise_error "planes can't land when it's stormy"      
    end
  
    it 'should not be possible for a plane to take off when it is stormy' do
      allow(airport).to receive(:weather){:sunny}
      airport.request_to_land(plane)
      allow(airport).to receive(:weather){:stormy}
      expect{airport.request_to_take_off(plane)}.to raise_error "planes can't take off when it's stormy"
    end

  end

end  