require 'airport'
require 'plane'

describe 'Airport Challenge' do

  context 'User stories' do

    it 'instructs planes to land at an airport' do
      airport = Airport.new(50)
      plane = Plane.new
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'instruct a plane to take off from an airport' do
      airport = Airport.new(50)
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it 'will not allow planes to land when airport is full' do
      airport = Airport.new(50)
      plane = Plane.new
      50.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport at capacity'
    end

  end

end
