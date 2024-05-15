require 'rails_helper'


RSpec.describe Student, type: :model do
  describe 'validations' do
    let(:student)  { build :student }
    let(:student1) { build :student, date_of_birth: Date.today()-14.years }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
    it { should validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
    it { should allow_value('John').for(:first_name) }
    it { should_not allow_value('John123').for(:first_name) }
    it { should allow_value('Doe').for(:last_name) }
    it { should_not allow_value('Doe123').for(:last_name) }

    it 'should be valid student with all attributes' do
      expect(student.valid?).to eq(true)
    end

    it "should raise error 'Age must be greater than 15' while creating student" do
      expect(student1.save).to eq(false)
      expect{student1.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'associations' do
    it { should have_many(:blogs) }
    it { should have_many(:student_projects) }
    it { should have_many(:projects).through(:student_projects) }
    it { should have_and_belong_to_many(:courses) }
  end

  describe 'custom methods' do
    let(:student3) { create(:student, first_name: 'John', last_name: 'Doe', email: 'john@example.com') }

    it 'should return full name' do
      expect(student3.full_name).to eq('John Doe')
    end

    it 'should calculate student age' do
      student3.update(date_of_birth: 20.years.ago)
      expect(student3.age).to eq(20)
    end

    it 'should return name with email' do
      expect(student3.name_with_email).to eq('John Doe / john@example.com')
    end

  end

  context 'when deleting a student' do
    let(:student) { create :student}
    let(:front_end_skill1) { create :front_end_skill }
    let(:front_end_skill2) { create :front_end_skill, name: 'CSS3' }

    let(:back_end_skill1) { create :back_end_skill }
    let(:back_end_skill2) { create :back_end_skill, name: 'Python' }

    let!(:student_skill1) { create :student_skill, student: student, skill: front_end_skill1, rating: 8   }
    let!(:student_skill2) { create :student_skill, student: student, skill: front_end_skill2, rating: 8   }
    let!(:student_skill3) { create :student_skill, student: student, skill: back_end_skill1, rating: 8   }

    it 'should destroy all student skills' do
      expect(student.skills.count).to eq(3)
      student.destroy
      expect(student.skills.count).to eq(0)
    end
  end

end
