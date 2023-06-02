class UsersController < ApplicationController
  before_action :prepare_params!, only: [:create]

  def new
    @user = User.new
  end

  def create
    puts params
    data = TwitterApi.new.get_user_from_token(params[:token][:access_token])
    @twitter_user = data
    puts @twitter_user

    @user = User.new(login_params)
    @user.twitter_id = @twitter_user['id']
    @user.twitter_name = @twitter_user['name']
    @user.twitter_username = @twitter_user['username']
    if @user.save
      puts @user
    #   log_in @user
    #   redirect_to @user
    else
      #   render 'new'
      puts 'here we are'
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
