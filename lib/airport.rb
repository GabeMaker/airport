class Airport

	def initialize
		@planes = []
	end

	def land(plane)
		plane.land!
		@planes << plane
	end

	def take_off(plane)
		plane.take_off!
		@planes.delete(plane)
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