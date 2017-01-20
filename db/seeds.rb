# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

def create_data
  100.times do
    restaurant = FactoryGirl.create(:restaurant)
    menu = FactoryGirl.create(:menu_item, restaurant_id: restaurant.id)
    tag = FactoryGirl.create(:tag, menu_item: menu)
  end
end


if Rails.env == "production"
  print "Seed file can not be run on production."
else
  create_data
  puts "Seed data generated :)"
end



