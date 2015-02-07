class Plane

  attr_accessor :flying

  def initialize
    @flying = false
  end

  def take_off
    self.flying = true 
  end

  def land
    self.flying = false
  end

end
