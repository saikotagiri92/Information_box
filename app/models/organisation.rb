class Organisation < ActiveRecord::Base
    
    #--------------------------Organisation Model Associations-------------------------------	
	has_many :users, dependent: :destroy
	has_many :boxes, :dependent => :destroy
    belongs_to :owner, class_name: User
    has_many :roles
    #--------------------------Server Side Validations-------------------------------
    validates :name, presence: true, length: { maximum: 250 }
	validates :owner_id, presence: true

    after_create :setup_basic_org
    
    def setup_basic_org
        box = Box.create(name: 'Welcome Box', description: 'This is a welcome box', organisation_id: self.id, created_by: self.owner.id)
        welcome_article_content = YAML.load(File.read("#{Rails.root}/config/welcome_article.yml"))
        Article.create(title: welcome_article_content["title"], content: welcome_article_content["content"], author_id: self.owner.id, box_id: box.id)
    end
end
