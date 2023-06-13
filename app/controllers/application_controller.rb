class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    puts decoded
    @current_user = User.find(decoded[:user_id])
    puts @current_user
  end
end
