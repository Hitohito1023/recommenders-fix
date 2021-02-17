FactoryBot.define do
  factory :post_item do
    name {"post_item_1"}
    introduction { Faker::Lorem.characters(number:50) }
    user_id {1}
    genre_id {1}
  end
end