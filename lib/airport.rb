class Airport

  attr_reader :planes, :capacity
  attr_accessor :weather

  def initialize(capacity=10)
    @planes   = []
    @weather  = set_weather_randomly
    @capacity = capacity
  end

  def request_to_land(incoming_plane)
    if weather != :stormy
      raise "planes can't land when airport is full" if planes.count >= capacity
      land(incoming_plane)
    else
      raise "planes can't land when it's stormy"
    end
  end

  def request_to_take_off(outgoing_plane)
    if weather != :stormy
      take_off(outgoing_plane)
    else
      raise "planes can't take off when it's stormy"
    end
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