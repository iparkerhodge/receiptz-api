class UsersController < ApplicationController
  before_action :prepare_params!, only: [:create]

  # client will send an access_token retrieved from twitter
  def create
    # get new user's twitter profile from the access_token
    data = TwitterApi.new.get_user_from_token(params[:token][:access_token])
    @twitter_user = data.transform_keys! { |k| "twitter_#{k}" }

    # create the new user
    puts params
    @user = User.new(@twitter_user)
    # @user.twitter_id = @twitter_user['id']
    # @user.twitter_name = @twitter_user['name']
    # @user.twitter_username = @twitter_user['username']
    if @user.save
      @user.access_token = params[:token][:access_token]
      @user.access_token_issued_at = params[:token][:issued_at]
      @user.refresh_token = params[:token][:refresh_token]

      render json: @user
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
