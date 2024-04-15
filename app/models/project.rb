class Project < ApplicationRecord
  paginates_per 10
  has_many :student_projects
  has_many :students, through: :student_projects

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["student_projects", "students"]
  end
end
