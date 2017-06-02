require_relative 'weather'

class Airport

  CAPACITY = 50

  def initialize(capacity = CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport at capacity' if full?
    raise 'Cannot land plane: stormy weather' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off plane: stormy weather' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
