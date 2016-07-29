class Box < ActiveRecord::Base

	#searchkick autocomplete: ['box_name', 'box_url_name'], suggest: ["box_name"]
    #--------------------Model Associations--------------------------
  	has_many :articles, :dependent => :destroy
    belongs_to :creator, foreign_key: :created_by, class_name: User
    has_and_belongs_to_many :users
    belongs_to :organisation

	#-------------------Server Side Validations------------------------------
	validates :name, :presence => true, :length => { :maximum => 100 }
	validates :description, :length => { :maximum => 160 }
	validates :organisation_id, :presence => true
	validates :created_by, :presence => true

	#------------------Box name computation-------------------------------
	def self.box_name_computation(box_name, organisation_id)
    if box_name != nil and organisation_id != nil
        if Box.find_by_box_name_and_organisation_id(box_name,organisation_id).present?
            @new_box_name = box_name.last =~ /\d/ ? box_name.succ : box_name + 1.to_s
            Box.box_name_computation(@new_box_name, organisation_id) if Box.find_by_box_name_and_organisation_id(@new_box_name, organisation_id).present?
            return @new_box_name
        else 
            return box_name
        end
    end
  end  

    #-------------------------Box Restrictions Update-----------------------------------
    def self.box_restriction_set(box_id, params_copy, current_logged_in_user)
        params_copy[:box_restrictions].each do |params_object| 
            user = User.find_by_id(params_object.first)
            if user != nil
                box_has_user = UsersHasBoxes.find_by_user_id_and_box_id(user.id, box_id)
                
                if box_has_user != nil
                    box_has_user.update_attribute(:restriction_assigned_by, current_logged_in_user.id) if box_has_user.update_attribute(:box_restriction_type, params_object.second["box_restriction"])
                else
                    user_has_box = UsersHasBoxes.create(:user_id => user.id, :box_id => box_id, :restriction_assigned_by => current_logged_in_user.id, :box_restriction_type => params_object.second["box_restriction"])
                end
            end
        end
    end
end
