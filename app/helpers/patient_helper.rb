module PatientHelper

  def linecount(field)
    [@patient[field].lines.count+1,3].max  
  end

  def empty_field
    
  end

	def proper_name(field)
    name = {pmhx: "Past Medical History",
            rx: "Medications",
            vitals: "Recent Vitals",
            exam: "Exam",
            ekg: "EKGs",
            echo: "Echocardiograms",
            cath: "Catheterizations",
            other: "Other Tests",
            summary: "Summary",

            surname: "Last Name",
            firstname: "First Name",
            mrn: "MRN",
            dob: "Date of Birth",
            diagnosis: "Primary Diagnosis"}
    name[field]
  end

end

