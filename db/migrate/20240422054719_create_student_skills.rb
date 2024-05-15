class CreateStudentSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :student_skills do |t|
      t.references :student
      t.references :skill
      t.integer :rating

      t.timestamps
    end
  end
end
