require_relative 'weather'

class Airport

  CAPACITY = 50
  attr_reader :planes

  def initialize(capacity = CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport at capacity' if full?
    raise 'Cannot land plane: stormy weather' if stormy?
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    raise 'Cannot take off plane: stormy weather' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
    plane.take_off
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def at_airport?(plane)
    planes.include?(plane)
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.pop
  end

end
