require 'airport'
require 'plane'

describe 'Airport Challege User Stories' do
  context 'Airport' do
    it 'instructs planes to land at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.land(plane) }.not_to raise_error
    end
  end
end
