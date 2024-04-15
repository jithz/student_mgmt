require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  context 'when creating an admin user' do
    let(:admin_user) { build :admin_user}

    it 'should be valid user with all attributes' do
      expect(admin_user.valid?).to eq(true)
    end
  end
end
