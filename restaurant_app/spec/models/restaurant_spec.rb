require "rails_helper"

RSpec.describe Restaurant, type: :model do
  let!(:restaurant) { create(:restaurant) }

  describe "#paged_search" do
    # let(:search_params) { { restaurant_id: nil } }
    let(:page_params) { { number: 1, size: 10 } }

    it "returns paged results of restaurants" do
      restaurants = Restaurant.paged_search(page_params)
      expect(restaurants).to include(restaurant)
    end

    it "returns pagigated results" do
      page_params = { number: 2, size: 10 }

      10.times { create(:restaurant) }

      restaurants = Restaurant.paged_search(page_params)
      expect(restaurants.size).to eq(1)
    end

    it "returns all restaurants if all is specified" do
      page_params = { all: true }

      10.times { create(:restaurant) }

      restaurants = Restaurant.paged_search(page_params)
      expect(restaurants.size).to eq(11)
    end
  end
end
