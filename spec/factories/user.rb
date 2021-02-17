FactoryBot.define do
  factory :user do
    name {"user_1"}
    email {"test@example.com"}
    introduction { Faker::Lorem.characters(number:50) }
    password {"password"}
    password_confirmation { "password" }
  end


end