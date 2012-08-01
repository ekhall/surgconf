module ApplicationHelper

	def full_title(page_title)
		base_title = "YNHCH Ped CTS"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

  def pretty_date(date)
    return date unless date.is_a?(Time)
    return date.strftime("%l:%M %P, %B %d, %Y") unless Time.now.year == date.year
    date.strftime("%l:%M %P, %B %d")
  end

  def pretty_date_with_year(date)
    date.strftime("%B %d, %Y")
  end

  def obfuscate_email(email)
      email.gsub("@", " at ").gsub(".", " dot ")
  end

end


