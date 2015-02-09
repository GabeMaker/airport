require 'plane'
require 'airport'

describe "Grand finale (spec from challenge)" do
  
  it 'all planes can land and all planes can take off' do
    airport = Airport.new
    plane1  = Plane.new
    plane2  = Plane.new
    plane3  = Plane.new
    plane4  = Plane.new
    plane5  = Plane.new
    plane6  = Plane.new
    allow(airport).to receive(:weather){:sunny}
    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    airport.land(plane4)
    airport.land(plane5)
    airport.land(plane6)
    expect(plane1.flying).to eq false
    expect(plane2.flying).to eq false
    expect(plane3.flying).to eq false
    expect(plane4.flying).to eq false
    expect(plane5.flying).to eq false
    expect(plane6.flying).to eq false
    airport.take_off(plane1)
    airport.take_off(plane2)
    airport.take_off(plane3)
    airport.take_off(plane4)
    airport.take_off(plane5)
    airport.take_off(plane6)
    expect(plane1.flying).to eq true
    expect(plane2.flying).to eq true
    expect(plane3.flying).to eq true
    expect(plane4.flying).to eq true
    expect(plane5.flying).to eq true
    expect(plane6.flying).to eq true
  end

end