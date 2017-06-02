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

    context 'when airport is full' do

      it 'does not allow planes to land' do
        50.times do
          airport.land(plane)
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
