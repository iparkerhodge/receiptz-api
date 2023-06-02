class ApplicationController < ActionController::API
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?

    store_location
    redirect_to login_url
  end
end
