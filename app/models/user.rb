class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :timeoutable
	
    #--------------------------User Model Associations-------------------------------   
    belongs_to :organisation
    belongs_to :role
    has_and_belongs_to_many :boxes

    #--------------------------Callback Functions-------------------------------
    before_save { self.email = email.downcase }
    delegate :name, :to => :organisation, prefix: true

 	#--------------------------Server Side Validations-------------------------------
    validates_presence_of :name
    validates :active, presence: true, default: false    



    scope :admin_users, -> { where(:admin => true) }    

    #--------------------------User email verification email token---------------------------------------
    def user_email_verification_token
        self.update_attribute('email_verification_token', SecureRandom.urlsafe_base64)
        self.update_attribute('email_verification_status', false)
        UserMailer.delay.user_email_verification_mail(self) 
    end


    #--------------------------User role in an organisation-------------------------------
    def self.user_role_in_organisation(user_id, organisation_id) 
        user_has_organisation =  UsersHasOrganisations.find_by_user_id_and_organisation_id(user_id, organisation_id)
        if user_has_organisation != nil
            return user_role_type = Role.find(user_has_organisation.role_id).role_name, user_id, organisation_id
        else
            return nil, user_id, organisation_id 
        end
    end
    
    #-------------------------User restriction for an article-----------------------------------
    def self.user_restriction_in_article(user_id, article_id)
        ArticleRestriction.article_restriction_types
        article_has_user = ArticleHasUser.find_by_user_id_and_article_id(user_id, article_id)
        if article_id != nil and user_id != nil and article_has_user == nil
            ArticleHasUser.create(:article_id => article_id,  :user_id => user_id, :restriction_assigned_by => user_id, :article_restriction_type => 'no restrictions')
            return user_restriction_in_article = ArticleHasUser.find_by_user_id_and_article_id(user_id, article_id).article_restriction_type
        elsif article_id != nil and user_id != nil and article_has_user.article_restriction_type == nil
            ArticleHasUser.find_by_user_id_and_article_id(user_id, article_id).update_attribute(:article_restriction_type,'no restrictions')
            ArticleHasUser.find_by_user_id_and_article_id(user_id, article_id).update_attribute(:restriction_assigned_by, user_id)
            return user_restriction_in_article = ArticleHasUser.find_by_user_id_and_article_id(user_id, article_id).article_restriction_type
        elsif article_id != nil and user_id != nil and article_has_user.article_restriction_type != nil
            return user_restriction_in_article = ArticleHasUser.find_by_user_id_and_article_id(user_id, article_id).article_restriction_type
        else return user_restriction_in_article = nil
        end
    end

    #----------------------------------User Restriction in a box-------------------
    def self.user_restriction_in_box(user_id, box_id)
        BoxRestriction.box_restriction_types
        box_has_user = UsersHasBoxes.find_by_user_id_and_box_id(user_id, box_id)
        if box_id != nil and user_id != nil and box_has_user == nil
            box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id('no restrictions')
            user_has_box = UsersHasBoxes.create(:user_id => user_id, :box_id => box_id, :restriction_assigned_by => user_id, :box_restriction_type => 'no restrictions')      
            return user_restriction_in_box = UsersHasBoxes.find_by_user_id_and_box_id(user_id, box_id).box_restriction_type
        elsif box_id != nil and user_id != nil and box_has_user.box_restriction_type == nil
            UsersHasBoxes.find_by_user_id_and_box_id(user_id, box_id).update_attribute(:box_restriction_type, 'no restrictions')
            UsersHasBoxes.find_by_user_id_and_box_id(user_id, box_id).update_attribute(:restriction_assigned_by, user_id)
            return user_restriction_in_box = UsersHasBoxes.find_by_user_id_and_box_id(user_id, box_id).box_restriction_type 
        elsif box_id != nil and user_id != nil and box_has_user.box_restriction_type != nil
            return user_restriction_in_box = UsersHasBoxes.find_by_user_id_and_box_id(user_id, box_id).box_restriction_type
        else return user_restriction_in_box
        end
    end

    #------------------Processing after a user is added into an organisation------------------------
    def self.post_user_addition_in_organisation_processing(organisation_object, user_object)
        if user_object != nil and organisation_object != nil
            role_type_id, role_type = Role.user_role_type('normal_user')
            user_has_organisations = UsersHasOrganisations.create(:user_id => user_object.id, :organisation_id => organisation_object.id, :role_id => role_type_id)
            box_restriction_type_id, restriction_type = BoxRestriction.box_restriction_type_id('no restrictions')
            organisation_object.boxes.each do |organisation_box|
                user_has_box = UsersHasBoxes.create(:user_id => user_object.id, :box_id => organisation_box.id, :restriction_assigned_by => organisation_object.owner_id, :box_restriction_type => 'no restrictions')      
            end
            return completion_status = "success", organisation_object, user_object 
        else
            return completion_status = "failure", organisation_object, user_object
        end
    end

    #-------------------User last week activity in organisations---------------------------------
    def self.user_activity_in_a_week
        User.all.each do |user|
            user.organisations.each do |user_organisation|
                Organisation.activity_in_organisation_in_a_week(user_organisation)
            end
        end
    end
    
    #-----------------------------User Name Initials------------------------------
    def self.user_name_initials(user_name)
        if user_name.present?
            splited_user_name = user_name.split(' ')
            if splited_user_name.size == 1
                user_name_first_word = splited_user_name.first
                user_name_first_word_first_two_characters = user_name_first_word[0..1].capitalize
                return user_name, user_name_first_word_first_two_characters
            else
                user_name_first_two_words = splited_user_name[0..1]
                first_word_first_character = user_name_first_two_words.first.first.capitalize
                second_word_first_character = user_name_first_two_words.second.first.capitalize
                user_name_initials = [first_word_first_character, second_word_first_character].join
                return user_name, user_name_initials
            end
        end
    end
end
