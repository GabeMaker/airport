class Plane

	def flying?
		true
	end

	def status
		if flying? == true
			"flying"
		else
			"landed"
		end
	end

end