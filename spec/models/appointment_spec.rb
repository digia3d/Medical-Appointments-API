require "rails_helper"

RSpec.describe Appointment, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:doctor) }
  end

  describe "validations" do
    subject { FactoryBot.build(:appointment) } # koristi factory za Appointment

    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(5).is_at_most(150) }
    it { should validate_presence_of(:scheduled_at) }
    it { should allow_value(1.day.from_now).for(:scheduled_at) }
    it { should_not allow_value(1.day.ago).for(:scheduled_at) }
  end

  describe "enums" do
    it {
      should define_enum_for(:status)
        .with_values(
          scheduled: 0,
          completed: 1,
          canceled: 2
        )
    }
  end
end
