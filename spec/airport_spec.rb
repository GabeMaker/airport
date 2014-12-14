require 'airport'
require 'plane'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) { Airport.new }

  context 'taking off and landing' do

    it 'a plane can land' do
      plane = Plane.new
      airport.land(plane)
      expect(plane).not_to be_flying
    end

    # it 'a plane can land (and be at the airport)'

    it 'a plane can take off' do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(plane).to be_flying
    end
  end

  context 'traffic control' do

    it 'should be able to count how many planes are landed' do
    #assuming airport starts empty
      expect(airport.plane_count).to eq(0)
      plane = Plane.new
      airport.land(plane)
      expect(airport.plane_count).to eq(1)
      airport.land(Plane.new)
      expect(airport.plane_count).to eq(2)
      5.times { airport.land(Plane.new) }
      expect(airport.plane_count).to eq(7)
      airport.take_off(plane)
      expect(airport.plane_count).to eq(6)
    end

    it 'should be able to count how many planes are landed v.2' do
      expect(airport.plane_count).to eq(0)
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      airport.land(plane3)
      airport.land(plane2)
      expect(airport.plane_count).to eq(2)
      airport.land(plane1)
      expect(airport.plane_count).to eq(3)
      airport.take_off(plane1)
      airport.take_off(plane2)
      airport.take_off(plane3)
      expect(airport.plane_count).to eq(0)
    end

    it 'should be possible to check if airport is full' do
      #assuming capacity is 10 planes
      expect(airport).not_to be_full
      9.times { airport.land(Plane.new) }
      plane = Plane.new
      airport.land(plane)
      expect(airport).to be_full
      airport.take_off(plane)
      expect(airport).not_to be_full
    end

    it 'a plane cannot land if the airport is full' do
      10.times { airport.land(Plane.new) }
      expect(airport).to be_full
      newplane = Plane.new
      expect(lambda { airport.land(newplane)}).to raise_error(RuntimeError, 'Can\'t land plane, Airport is full')


  # expect(lambda { holder.dock(bike)}).to raise_error(RuntimeError, 'No room for bikes')

    end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do

      end

      it 'a plane cannot land in the middle of a storm' do

      end
    end
  end
end

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to be_flying
    expect(plane.status).to eq ("flying")
  end

  it 'has a flying status when in the air' do
    plane.land!
    expect(plane).not_to be_flying
    plane.take_off!
    expect(plane.status).to eq("flying")
  end

  it 'can take off' do

  end

  it 'changes its status to flying after taking of' do

  end
end

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

  it 'all planes can land and all planes can take off' do

  end
end