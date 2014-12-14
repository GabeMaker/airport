class Plane

	def initialize
		@flying = true
	end

	def flying?
		if @flying == true
			return true
		else
			return false
		end
		
	end

	def land!
		@flying = false
	end

	def take_off!
		@flying = true
	end
end