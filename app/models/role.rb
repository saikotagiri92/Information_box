class Role < ActiveRecord::Base
	belongs_to :organisation
	has_many :users

	validates_presence_of :organisation_id
	validates :name, uniqueness: {scope: :organisation_id}
end
