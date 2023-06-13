class UsersController < ApplicationController
  before_action :prepare_params!, only: %i[create index]

  def index
    puts params
    token_data = TwitterApi.new.get_new_access_token_from_refresh_token(params[:token][:refresh_token])

    user_data = TwitterApi.new.get_user_from_token(token_data['access_token'])
    @twitter_user = user_data.transform_keys! { |k| "twitter_#{k}" }

    @user = User.find_by twitter_username: @twitter_user['twitter_username']
    # TO DO: check if display name, profile image, etc has changed and update user if so

    if @user
      @user.access_token = token_data['access_token']
      @user.access_token_issued_at = DateTime.now
      @user.refresh_token = token_data['refresh_token']

      render json: @user, status: 200
    else
      render status: :unprocessable_entity
    end
  end

  # client will send an access_token retrieved from twitter
  def create
    # get new user's twitter profile from the access_token
    data = TwitterApi.new.get_user_from_token(params[:token][:access_token])
    @twitter_user = data.transform_keys! { |k| "twitter_#{k}" }

    # first check if user exists
    @existing_user = User.find_by twitter_username: @twitter_user['twitter_username']
    if @existing_user
      @existing_user.access_token = params[:token][:access_token]
      @existing_user.access_token_issued_at = params[:token][:issued_at]
      @existing_user.refresh_token = params[:token][:refresh_token]
      render json: @existing_user
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
      render json: nil, status: :unprocessable_entity
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
