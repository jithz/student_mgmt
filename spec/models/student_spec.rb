require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'when creating a student' do
    let(:student) { build :student }
    let(:student1) { build :student, date_of_birth: Date.today()-14.years }

    it 'should be valid student with all attributes' do
      expect(student.valid?).to eq(true)
    end

    it "should raise error 'Age must be greater than 15' while creating student" do
      expect(student1.save).to eq(false)
      expect { student1.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end


  end
end
