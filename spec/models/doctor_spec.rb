require "rails_helper"

RSpec.describe Doctor, type: :model do
  describe "associations" do
    it { should have_many(:appointments).dependent(:destroy) }
  end
end
