class Weather

	def sunny?
		if rand(9) <= 7
			true
		else
			false
		end
	end
end

weather = Weather.new
if weather.sunny? == true
	puts "it's sunny at the airport"
else
	puts "a storm is brewing"
end