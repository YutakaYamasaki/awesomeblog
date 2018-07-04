module ApplicationHelper
	def full_title(page_title)
		base_title = "Awesome Blog App"

		if page_title.empty?
			"Awesome Blog"
		else
			page_title + "|" + base_title
		end
	end
end
