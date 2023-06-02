class SessionsController < ApplicationController
  before_action :prepare_params!, only: [:create]
  def new; end

  def create
    data = TwitterApi.new.get_user_from_token(params[:token][:access_token])
    @twitter_user = data
    @user = User.find_by twitter_username: @twitter_user['username']

    if @user
      log_in @user
      render json: @user, status: 200
    else
      @user = User.new(login_params)
      @user.twitter_id = @twitter_user['id']
      @user.twitter_name = @twitter_user['name']
      @user.twitter_username = @twitter_user['username']
      if @user.save
        log_in @user
        render json: @user, status: 200
      else
        render status :unprocessable_entity
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def login_params
    params.require(:token).permit(:access_token, :issued_at, :refresh_token)
  end

  def prepare_params!
    request.parameters.deep_transform_keys!(&:underscore)
  end
end
