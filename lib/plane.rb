class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane cannot take off: plane in the air' if flying
  end

  def land(airport)
    raise 'Plane cannot land: plane already landed' if landed
    @flying = false
    @airport = airport
  end

  def airport
    raise 'Plane not at Airport: plane in the air' if flying
    @airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end

end
