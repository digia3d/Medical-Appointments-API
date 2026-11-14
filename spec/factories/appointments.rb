FactoryBot.define do
  factory :appointment do
    description { 'Regular checkup' }
    scheduled_at { 1.day.from_now }
    status { 'scheduled' }

    association :user
    association :doctor
  end
end
