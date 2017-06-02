class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane cannot take off: plane in the air' if @flying
  end

  def land(airport)
    raise 'Plane cannot land: plane already landed' unless @flying
    @flying = false
    @airport = airport
  end

  def airport
    raise 'Plane not at Airport: plane in the air' if @flying
    @airport
  end

end
