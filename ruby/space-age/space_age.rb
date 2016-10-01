
class SpaceAge
  def initialize(seconds)
    @seconds = seconds
  end

  attr_reader :seconds

  EARTH_YEAR = 31557600.0

  def on_earth
    seconds / EARTH_YEAR
  end

  def on_mercury
    seconds / ( EARTH_YEAR * 0.2408467)
  end

  def on_venus
    seconds / ( EARTH_YEAR * 0.61519726)
  end

  def on_mars
    seconds / ( EARTH_YEAR * 1.8808158)
  end

  def on_jupiter
    seconds / ( EARTH_YEAR * 11.862615)
  end

  def on_saturn
    seconds / ( EARTH_YEAR * 29.447498)
  end

  def on_uranus
    seconds / ( EARTH_YEAR * 84.016846)
  end

  def on_neptune
    seconds / ( EARTH_YEAR * 164.79132)
  end
end
