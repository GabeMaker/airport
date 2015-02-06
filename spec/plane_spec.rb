require 'plane'

describe Plane do

  it 'should not be flying when created' do
    # create a plane
    # check if it's flying
    expect(Plane.new).not_to be_flying
  end

  it 'should be able to take off' do
    # plane is not flying
    # plane takes off
    # plane is flying
    plane = Plane.new
    plane.take_off
    expect(plane).to be_flying 
  end

end