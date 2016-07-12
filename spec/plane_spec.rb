require 'plane'

describe Plane do
  it 'is expected to respond to the method landed?' do
    expect(subject.respond_to?(:landed?)).to eq true
  end
end
