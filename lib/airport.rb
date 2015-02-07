class Airport

  def initialize
    @planes = []
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
    @weather ||= :sunny 
  end

  def weather=(weather)
    @weather = weather
  end

end