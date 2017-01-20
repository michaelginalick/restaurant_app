FactoryGirl.define do
  factory :restaurant do
    name        { Faker::Company.name }
    description { Faker::Lorem.characters(100) }
    address     { Faker::Address.city + " " + Faker::Address.state + " " + Faker::Address.street_address}
    rating      { rand(0.0..5.0).round(1) }
  end

  trait :with_tagged_menu_items do
    after(:create) do |restaurant|
      5.times do
        menu_item = create(:menu_item, restaurant: restaurant)
        tags = create(:tag, menu_item: menu_item)
        restaurant.menu_items << menu_item
        menu_item.tags << tags
      end
    end
  end
end
