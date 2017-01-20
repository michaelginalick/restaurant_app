FactoryGirl.define do
  factory :menu_item do
    name             { Faker::Food.ingredient }
    description      { Faker::Lorem.characters(100) }
    category         { %w(entree appetizer dessert beverage side).sample }
    restaurant_id    { Faker::Number.number(2) }
  end
end
