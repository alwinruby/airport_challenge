require 'airport'
require 'plane'
require 'weather'

describe 'Airport Challege' do

  let(:airport) { Airport.new(50, weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context 'when not stormy' do

    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'instructs planes to land at an airport' do
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'instruct a plane to take off from an airport' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    context 'airport full' do

      it 'will not allow planes to land when airport is full' do
        50.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport at capacity'
      end

    end

  end

  context 'when stormy' do

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
