require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'raises an error if flying' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off: plane in the air'
    end

  end

  describe '#airport' do

    it { is_expected.to respond_to :airport }

    it 'raises an error if already flying' do
      expect { plane.airport }.to raise_error 'Plane not at Airport: plane in the air'
    end

  end
  
end
