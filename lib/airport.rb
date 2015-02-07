class Airport

  attr_reader :planes
  attr_accessor :weather

  def initialize
    @planes   = []
    @weather  = set_weather_randomly
  end

  def land(incoming_plane)
    incoming_plane.land
    planes << incoming_plane
  end

  def take_off(outgoing_plane)
    outgoing_plane.take_off
    planes.delete(outgoing_plane)
  end

  def set_weather_randomly
    if rand(5) == 0
      random_weather = :stormy
    else
      random_weather = :sunny
    end
    self.weather = random_weather
  end

end