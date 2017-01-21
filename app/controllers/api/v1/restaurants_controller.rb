module Api

  module V1

    class RestaurantsController < ApiController

      api :GET, "/v1/restaurants", "Get all restaurants"
      description "Fetch all restaurants, pagination optional"
      param :page, Hash, "page[:number] (defaults to 1) and page[:size] (defaults to 10)", required: false

      error code: 403, desc: "Not authorized"
      error code: 500, desc: "There was an internal server error."

      def index
        render json: Restaurant.paged_search(page_params)
      end


      api :GET, "/v1/restaurants/show", "Get restaurant menu items"
      description "Find restaurant by id and return menu items"
      param :restaurant_id, :undef, "ID of a restaurant", required: true
      param :page, Hash, "page[:number] (defaults to 1) and page[:size] (defaults to 10)", required: false

      error code: 403, desc: "Not authorized"
      error code: 422, desc: "One or more required paramters are missing"
      error code: 500, desc: "There was an internal server error."

      def show
        if restaurant_search_params.present?
          menu_info = MenuItem.paged_search(restaurant_search_params, page_params)
          render json: menu_info.to_json(include: :tags)
        else
          render json: [], meta: {}, status: 422
        end
      end

      private

      def restaurant_search_params
        params.permit(:restaurant_id)
      end


      def page_params
        return {} unless params[:page]
        params.require(:page).permit(:number, :size, :all).to_h.tap do |result|
          result[:number] = Integer(result[:number]) unless result[:number].blank?
          result[:size] = Integer(result[:size]) unless result[:size].blank?
        end
      end
    end
  end
end