require 'airport'
require 'plane'

describe Airport do
  
  let (:airport) { Airport.new }
  let (:plane)  { double :plane,  land: nil, take_off: nil } # is this 'nil' OK / convention - added to get past 'double received unexpected?
  let (:plane2) { double :plane2, land: nil, take_off: nil }

  context "Take off, landing and tracking planes" do

    it 'should have no planes landed on creation' do
      allow(airport).to receive(:weather) { :sunny }
      expect(airport.planes).to eq []
    end

    it 'should be able to tell a plane to land at it' do
      allow(airport).to receive(:weather) { :sunny }
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    it 'should know a plane has landed at it' do
      allow(airport).to receive(:weather) { :sunny }
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'should be able to tell a plane to take off from it' do
      allow(airport).to receive(:weather) { :sunny }
      airport.land(plane)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end

    it 'should know a plane has taken off from it' do
      allow(airport).to receive(:weather) { :sunny }
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'should be able to land two planes' do
      allow(airport).to receive(:weather) { :sunny }
      airport.land(plane)
      airport.land(plane2)
      expect(airport.planes).to eq [plane, plane2]
    end

    it 'should let two planes take off' do
      allow(airport).to receive(:weather) { :sunny }
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      airport.take_off(plane2)
      expect(airport.planes).to eq []
    end

    it 'should let a plane take_off while others stay landed' do
      allow(airport).to receive(:weather) { :sunny }
      airport.land plane
      airport.land plane2
      airport.take_off plane
      expect(airport.planes).to eq [plane2]
    end    

    it 'a plane cannot land if the airport is full' do
      allow(airport).to receive(:weather) { :sunny }
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
      airport.land(plane)
      allow(airport).to receive(:weather){:stormy}
      expect{airport.request_to_take_off(plane)}.to raise_error "planes can't take off when it's stormy"
    end

  end
end  

# Note for refactoring:
# before(:each) { allow(airport).to receive(:stormy?).and_return(false) }
# ? need to change land(plane) to request_to_land(plane) in test suite (and the same for take_off)
