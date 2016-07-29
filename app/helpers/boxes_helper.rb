module BoxesHelper

	#-------------------------------User recent box processing----------------------------------
	def user_recent_box_processing
		user_restriction_type_in_box = User.user_restriction_in_box(current_user.id, @box.id)
		if user_restriction_type_in_box == "edit restrictions" or user_restriction_type_in_box == "no restrictions"
			user_recent_box = UserRecentBox.find_by_user_id_and_box_id_and_organisation_id(current_user.id, @box.id, current_organisation.id)
			if user_recent_box != nil
				user_recent_box.update_attribute(:last_accessed_at, Time.now)
			else
				UserRecentBox.create(:user_id => current_user.id,  :organisation_id => current_organisation.id, :box_id => @box.id, :last_accessed_at => Time.now)	
			end
		end
	end
end
