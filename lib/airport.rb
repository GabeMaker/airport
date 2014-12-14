require 'weather.rb'

class Airport

	include Weather

	def initialize
		@planes = []
	end

	def land(plane)
		if sunny? == false
			raise 'Can\'t land, Airport is stormy'
		else
			raise 'Can\'t land plane, Airport is full' if full?
			plane.land!
			@planes << plane
		end
	end

	def take_off(plane)
		if sunny? == false
			raise 'Can\'t take off, Airport is stormy'
		else
			plane.take_off!
			@planes.delete(plane)
		end
	end 

	def plane_count
		@planes.count
	end

	def full?
		if plane_count <= 9
			false
		else
			true
		end
	end

end