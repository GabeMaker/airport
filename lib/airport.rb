class Airport

  def initialize
    @planes   = []
    @weather  = random_weather
  end

  def planes
    @planes ||= []
  end

  def land(incoming_plane)
    incoming_plane.land
    @planes << incoming_plane
  end

  def take_off(outgoing_plane)
    outgoing_plane.take_off
    @planes.delete(outgoing_plane)
  end

  def weather
    @weather
  end

  def random_weather
    if rand(5) == 0
      @weather = :stormy
    else
      @weather = :sunny
    end
    weather
  end



end