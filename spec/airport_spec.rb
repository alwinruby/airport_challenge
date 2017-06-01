require 'airport'

describe Airport do

  subject(:airport) { described_class.new(50) }
  let(:plane) { double :plane }

  describe '#land' do

    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'airport full' do

      it 'does not allow a plane to land when at full capacity' do
        50.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport at capacity'
      end

    end

  end


  describe '#take_off' do

    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

  end

end
