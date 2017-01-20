# frozen_string_literal: true
require "rails_helper"

describe "Restaurants API", type: :request, request_auth: true do
  let(:headers) { { "Authorization" => token.access_token } }
  let(:token) { create(:api_key) }

  describe "GET index" do
    context "return all restaurants" do
      let(:params) { { page: { number: 0, size: 3 } } }
      it "returns restaurants", :aggregate_failures do
        3.times { create(:restaurant) }

        get "/api/v1/restaurants", params: params, headers: headers

        data = JSON.parse(response.body)

        expect(data.size).to eq 3
        expect(response.status).to eq(200)
        expect(data.first).to have_key("id")
        expect(data.first).to have_key("name")
        expect(data.first).to have_key("description")
        expect(data.first).to have_key("address")
        expect(data.first).to have_key("rating")
      end
    end

    it "returns a 403 when the token is not sent in the header", :aggregate_failures do
      get "/api/v1/restaurants"
      expect(response.status).to eq(403)
    end

    context "given pagination params" do
      let(:params) { { page: { number: 0, size: 1 } } }

      it "returns a subset of restaurants" do
        additional_restaurants = create_list(:restaurant, 10)
        get "/api/v1/restaurants", params: params, headers: headers
        data = JSON.parse(response.body)
        expected = [additional_restaurants.first.id]
        expect(data.collect { |c| c["id"] }).to eq expected
      end
    end
  end

  describe "GET show" do
    context "returns restaurants menu items and tags" do
      let!(:restaurant) { create(:restaurant, :with_tagged_menu_items) }
      let!(:params) { { restaurant_id: restaurant.id, page: { number: 0, size: 10 } } }

      it "returns restaurants menu items", :aggregate_failures do
        get "/api/v1/restaurants/show", params: params, headers: headers

        data = JSON.parse(response.body)
        expect(data.size).to eq 5
        expect(data.first).to have_key("tags")
        expect(data.first).to have_key("name")
        expect(data.first).to have_key("description")
        expect(data.first).to have_key("category")
      end

      it "returns a 403 when the token is not sent in the header", :aggregate_failures do
        get "/api/v1/restaurants/show"
        expect(response.status).to eq(403)
      end
    end

    context "returns appropriate responses" do
      let(:bad_params) { { page: { number: 0, size: 10 } } }
      let(:good_params) { { restaurant_id: 5000, page: { number: 0, size: 10 } } }

      it "returns 422 when param is missing", :aggregate_failures do
        get "/api/v1/restaurants/show", params: bad_params, headers: headers
        expect(response.status).to eq(422)
      end

      it "returns 200 when request is valid no records are returned", :aggregate_failures do
        get "/api/v1/restaurants/show", params: good_params, headers: headers
        data = JSON.parse(response.body)
        expect(data.size).to eq(0)
        expect(response.status).to eq(200)
      end
    end
  end
end
