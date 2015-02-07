require 'airport'

describe Airport do
  
  let (:airport) { Airport.new }

  it 'should have no planes landed on creation' do
    expect(airport.planes).to eq []
  end

  it 'should be able to tell a plane to land at it' do
    incoming_plane = double :plane
    expect(incoming_plane).to receive(:land)
    airport.land(incoming_plane)
  end




    

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



end