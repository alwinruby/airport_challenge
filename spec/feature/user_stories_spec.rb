require 'airport'
require 'plane'
require 'weather'

describe 'User Stories' do

  let(:airport) { Airport.new(50, weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context 'when not stormy' do

    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'so planes take off from airports, instruct a plane to take off' do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it 'takes off planes only from the airport they are at' do
      airport_2 = Airport.new(50, weather)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: plane not at this airport'
    end

    it 'airports have a default capacity' do
      default_airport = Airport.new(weather)
      Airport::CAPACITY.times do
        the_plane = Plane.new
        default_airport.land(the_plane)
      end
      expect { default_airport.land(plane) }.to raise_error 'Cannot land plane: airport at capacity'
    end

    it 'flying planes cannot take off' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off: plane in the air'
    end

    it 'flying planes cannot be in an airport' do
      expect { plane.airport }.to raise_error 'Plane not at Airport: plane in the air'
    end

    it 'non-flying planes cannot land' do
      airport.land(plane)
      expect { plane.land(airport) }.to raise_error 'Plane cannot land: plane already landed'
    end

    it 'taking off a plane removes it from that airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    context 'when airport is full' do

      it 'does not allow planes to land' do
        50.times do
          the_plane = Plane.new
          airport.land(the_plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport at capacity'
      end

    end

  end

  context 'when weather is stormy' do

    before do
      allow(weather).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: stormy weather'
    end

    it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: stormy weather'
    end

  end

end
