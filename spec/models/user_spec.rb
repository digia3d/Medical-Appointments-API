require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:appointments).dependent(:destroy) }
    it { should have_many(:doctors).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end

  describe 'secure password' do
    it 'authenticates with the correct password' do
      user = create(:user, password: 'password123', password_confirmation: 'password123')

      expect(user.authenticate('password123')).to be_truthy

      expect(user.authenticate('wrongpass')).to be_falsey
    end
  end
end
