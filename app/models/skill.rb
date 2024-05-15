class Skill < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true

  has_many :student_skills
  has_many :students, through: :student_skills
end
