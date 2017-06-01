require 'airport'
require 'plane'

describe 'Airport Challege' do
  context 'User stories' do
    it 'instructs planes to land at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'instruct a plane to take off from an airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end
  end
end
