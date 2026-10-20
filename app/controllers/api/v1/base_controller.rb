class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from ActiveRecord::RecordNotFound do
    render json: { errors: ["Not found"] }, status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |error|
    render json: { errors: [error.message] }, status: :bad_request
  end

  rescue_from ActionController::BadRequest do |error|
    render json: { errors: [error.message] }, status: :bad_request
  end

  private

  def authenticate
    expected_token = Rails.application.credentials.api_token
    authenticated = authenticate_with_http_token do |token, _options|
      request.authorization.start_with?("Bearer ") && expected_token.present? &&
        ActiveSupport::SecurityUtils.secure_compare(token, expected_token)
    end

    unless authenticated
      render json: { errors: ["Unauthorized"] }, status: :unauthorized
    end
  end
end