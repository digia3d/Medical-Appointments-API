FactoryBot.define do
  factory :user do
    name { 'Alex' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password123' }
    password_confirmation { password }
  end
end
