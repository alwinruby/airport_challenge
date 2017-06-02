require 'airport'
require 'plane'

describe 'Airport Challenge' do
  let(:airport) { Airport.new(50) }
  let(:plane) { Plane.new }

  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'instructs planes to land at an airport' do
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'instruct a plane to take off from an airport' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    context 'airport at capacity' do

      it 'will not allow planes to land when airport is full' do
        50.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport at capacity'
      end

    end

  end

  context 'sormy weather' do

    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'will not let planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: stormy weather'
    end

    it 'will not let planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: stormy weather'
    end

  end

end
