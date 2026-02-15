require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:appointments).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:doctor) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:specialization) }
    it { should validate_presence_of(:photo) }
  end
end
