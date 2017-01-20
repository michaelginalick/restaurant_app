FactoryGirl.define do
  factory :tag do
    name          { Faker::TwinPeaks.location }
    menu_item_id  { Faker::Number.number(2) }
  end
end
