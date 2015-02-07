require 'airport'

describe Airport do
  
  it 'should have no planes landed on creation' do
    expect(Airport.new.planes).to eq []
  end

  # it 'should be able to tell a plane to land at it' do
  #   airport = Airport.new
  #   incoming_plane = double :plane

  #   expect(airport.planes).to eq []
  #   expect(incoming_plane).to receive(:land)
  #   airport.land(incoming_plane)
  #   expect(airport.planes).to eq [plane]
      # tell flying plane to land
      # plane should land in airport and be in airport
  # end

  ## 'should not be able to tell a non flying plane to land'
  ## this should probably be the responsibility of the plane:
  ## e.g. 'should not be able to land if not flying'



end