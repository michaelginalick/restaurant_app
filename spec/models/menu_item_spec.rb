require "rails_helper"

RSpec.describe MenuItem, type: :model do
  let!(:restaurant) { create(:restaurant) }
  let!(:menu_item) { create(:menu_item, restaurant_id: restaurant.id) }

  describe "#paged_search" do
    let(:search_params) { { restaurant_id: restaurant.id } }
    let(:page_params) { { number: 1, size: 10 } }

    it "returns paged results of menu_items" do
      restaurants = MenuItem.paged_search(search_params, page_params)
      expect(restaurants).to include(menu_item)
    end

    it "returns pagigated results" do
      page_params = { number: 2, size: 10 }

      10.times { create(:menu_item, restaurant_id: restaurant.id) }

      menu_items = MenuItem.paged_search(search_params, page_params)
      expect(menu_items.size).to eq(1)
    end

    it "returns all menu_items if all is specified" do
      page_params = { all: true }

      10.times { create(:menu_item, restaurant_id: restaurant.id) }

      menu_items = MenuItem.paged_search(search_params, page_params)
      expect(menu_items.size).to eq(11)
    end
  end
end
