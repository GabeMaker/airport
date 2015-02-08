require 'plane'

describe Plane do

  let(:plane) {Plane.new}

  it 'should be flying when created' do
    expect(plane.flying).to eq true
  end

  it 'should be able to take off' do
    plane.land
    plane.take_off
    expect(plane.flying).to eq true
  end

  it 'should be able to land' do
    plane.land
    expect(plane.flying).to eq false
  end

end