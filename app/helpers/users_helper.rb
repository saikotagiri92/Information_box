module UsersHelper

	def signup_form_errors(user, org)
		errors = user.errors.full_messages.each_with_object([]) do |error, a|
			a << "User's #{error.downcase}"
		end
		if org.present?
			org.errors.full_messages.each do |error| 
				errors << "Organisation's #{error.downcase}"
			end
		end
		errors
	end
end
