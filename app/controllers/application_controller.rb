class ApplicationController < ActionController::Base
  include Authentication
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  after_action :verify_authorized
  after_action :verify_policy_scoped, if: -> { action_name == "index" }

  private

  def pundit_user
    Current.user
  end

  def user_not_authorized
    render "shared/forbidden", status: :forbidden
  end
end
