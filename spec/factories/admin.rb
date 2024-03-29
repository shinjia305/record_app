FactoryBot.define do
  factory :admin do
    name     { Faker::Lorem.characters(number: 5) }
    email    { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end
