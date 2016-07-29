module ApplicationHelper
	#----------------------Main Title----------------------------
    def full_title(page_title, box_name, org_name)
        base_title = "Information Box"
        if org_name.empty?
        	if page_title.empty?
                base_title
            else 
                "#{page_title} | #{base_title}"
            end	
        else
        	if box_name.empty?
   	        	if page_title.empty?
                	"#{org_name} | #{base_title}"
            	else 
                	"#{page_title} | #{org_name} | #{base_title}"
            	end
        	else
            	if page_title.empty?
                	"#{box_name} | #{org_name} | #{base_title}"
           		else 
                	"#{page_title} | #{box_name} | #{org_name} | #{base_title}"
            	end
            end
        end
    end

    def handle_associated_data_nil_error(associated_object, field)
        associated_object.present? ? associated_object.send(field).titleize : 'Anonymous'
    end

    def get_root_path
        user_signed_in? ? organisation_url(@organisation) : '/'
    end

    def get_user_permission_for_action(action)
        @organisation.owner == current_user || current_user.role.try(:send, "can_access_#{action}?")
    end

    #----------------------Time as ago display------------------------
    def time_as_ago_calculation(start_time)
        time_difference_in_general = TimeDifference.between(start_time, Time.now).in_general
        time_difference_in_general.keys.each do |time_difference_in_general_key|
            if time_difference_in_general[time_difference_in_general_key] != 0
                if time_difference_in_general[time_difference_in_general_key] == 1
                    return "#{time_difference_in_general[time_difference_in_general_key]} #{time_difference_in_general_key.to_s.sub(/.$/, '')} ago" 
                else
                    return "#{time_difference_in_general[time_difference_in_general_key]} #{time_difference_in_general_key.to_s} ago"
                end
            end
        end
        return "0 seconds ago"
    end

    #----------------------- Organisation name for main title------------------------
    def organisation_name_fetch
        @organisation.try(:organisation_name)
    end

    #-----------------------User Authentication--------------------------------
    def is_current_user_admin_or_owner?
      current_user.admin? || @organisation.owner == current_user
    end
end
