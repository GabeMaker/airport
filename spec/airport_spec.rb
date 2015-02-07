require 'airport'

describe Airport do
  
  let (:airport) { Airport.new }
  let (:plane)  { double :plane,  land: nil, take_off: nil } # is this 'nil' OK / convention - added to get past 'double received unexpected?
  let (:plane2) { double :plane2, land: nil, take_off: nil }

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

end  




  # should not be able to land at more than one airport    

  #   expect(airport.planes).to eq []
  #   expect(incoming_plane).to receive(:land)
  #   airport.land(incoming_plane)
  #   expect(airport.planes).to eq [plane]
  #     tell flying plane to land
  #     plane should land in airport and be in airport
  # end

  ## 'should not be able to tell a non flying plane to land'
  ## this should probably be the responsibility of the plane:
  ## e.g. 'should not be able to land if not flying'
