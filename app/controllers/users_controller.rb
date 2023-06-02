class UsersController < ApplicationController
  before_action :prepare_params!, only: [:create]

  # client will send an access_token retrieved from twitter
  def create
    # get new user's twitter profile from the access_token
    data = TwitterApi.new.get_user_from_token(params[:token][:access_token])
    @twitter_user = data.transform_keys! { |k| "twitter_#{k}" }

    # first check if user exists
    @existing_user = User.find_by twitter_username: @twitter_user['twitter_username']
    if @existing_user
      render json: @existng_user
      return
    end

    # create the new user
    @user = User.new(@twitter_user)
    if @user.save
      @user.access_token = params[:token][:access_token]
      @user.access_token_issued_at = params[:token][:issued_at]
      @user.refresh_token = params[:token][:refresh_token]

      render json: @user
    else
      render json: nil, status: unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:token).permit(:access_token, :issued_at, :refresh_token)
  end

  def prepare_params!
    request.parameters.deep_transform_keys!(&:underscore)
  end
end
