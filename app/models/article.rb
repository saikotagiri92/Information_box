class Article < ActiveRecord::Base
	
    #include Tire::Model::Search
    #include Tire::Model::Callbacks
	#-----------------------------Gem methods-------------------------
	has_ancestry
	#searchkick autocomplete: ['title', 'article_content'], suggest: ["title"]

	#-----------------------------Model Associations--------------------
	has_many :comments, :dependent => :destroy
	belongs_to :box
	belongs_to :author, class_name: User
	
    #-----------------------------------Server side validations-------------------------------
	validates :title, :presence => true, length: { maximum: 250 }
	validates :author_id, :presence => true
	validates :box_id, :presence => true
end

