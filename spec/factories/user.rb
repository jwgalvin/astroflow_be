FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) } 
    email { Faker::Internet.email }
  end
end