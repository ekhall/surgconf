module PatientHelper

	def sizer_helper(field)
		if field == "mrn"
			10
		else
			30
		end
	end

end
