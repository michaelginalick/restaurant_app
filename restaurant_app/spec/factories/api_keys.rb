# frozen_string_literal: true
FactoryGirl.define do
  factory :api_key do
    access_token { Faker::Lorem.characters(32) }
  end
end
