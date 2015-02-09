class Weather
  
  attr_accessor :weather

  def initialize
    @weather = set_weather_randomly
  end

  def set_weather_randomly
    if rand(5) == 0
      random_weather = :stormy
    else
      random_weather = :sunny
    end
    self.weather = random_weather
  end

  def check
    weather
  end

end