require_relative 'weather'

class Airport

  attr_reader :planes, :capacity
  attr_reader :weather

  def initialize(capacity=10)
    @planes   = []
    @weather  = Weather.new
    @capacity = capacity
  end

  def land(incoming_plane)
    if weather == :stormy
      raise "planes can't land when airport is full" if planes.count >= capacity
      incoming_plane.land
      planes << incoming_plane
    else
      raise "planes can't land when it's stormy"
    end
  end

  def take_off(outgoing_plane)
    if weather != :stormy
      outgoing_plane.take_off
      planes.delete(outgoing_plane)
    else
      raise "planes can't take off when it's stormy"
    end
  end

end