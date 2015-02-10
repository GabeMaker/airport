class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def take_off
    self.flying = true 
  end

  def land
    self.flying = false
  end

  def flying?
    flying
  end
end
