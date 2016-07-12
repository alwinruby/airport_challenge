require 'airport'

describe Airport do
  describe '#land' do

    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'confirms a plane has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

  end
end
