class Course < ApplicationRecord
	paginates_per 10
	has_and_belongs_to_many :students
	has_rich_text :content

	def self.ransackable_attributes(auth_object = nil)
	["created_at", "description", "id", "name", "updated_at"]
end
end
