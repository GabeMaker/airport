require 'plane'
require 'airport'

describe "Grand finale (spec from challenge)" do
  
  it 'all planes can land and all planes can take off' do
    
    airport = Airport.new
    all_six = Array.new(6, Plane.new)
    
    allow(airport).to receive(:weather){:sunny}
    
    all_six.each { |plane| airport.request_to_land(plane)     }
    all_six.each { |plane| expect(plane.flying).to eq false   }
    all_six.each { |plane| airport.request_to_take_off(plane) }
    all_six.each { |plane| expect(plane.flying).to eq true    }
  
  end

end