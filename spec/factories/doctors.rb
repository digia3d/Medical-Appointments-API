FactoryBot.define do
  factory :doctor do
    name { "Dr. Strange" }
    specialization { "Cardiology" }
    association :user
  end
end
