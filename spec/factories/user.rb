FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
  end
end
