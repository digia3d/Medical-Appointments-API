FactoryBot.define do
  factory :doctor do
    name { 'Dr. Strange' }
    specialization { 'Cardiology' }
    photo { 'https://pixabay.com/images/download/mufidpwt-doctor-784329_1920.png' }
    association :user
  end
end
