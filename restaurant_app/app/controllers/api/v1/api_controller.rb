# frozen_string_literal: true
module Api

  module V1

    class ApiController < ApplicationController

      before_action :authenticate_request

      rescue_from ActiveRecord::RecordNotFound do
        head :not_found
      end

      rescue_from ActionController::ParameterMissing, Apipie::ParamMissing do |error|
        render json: error.message, status: :unprocessable_entity
      end

      private

      def authenticate_request
        head 403 unless request.headers["Authorization"] &&
                        ApiKey.exists?(access_token: request.headers["Authorization"])
      end

    end

  end

end
