class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create index]
  before_action :prepare_params!, only: %i[create index]

  def index
    @user = User.find_by mobile_number: params['mobile_number']

    if @user && @user.authenticate(params['password'])
      render json: @current_user, status: 200
    else
      render status: :unprocessable_entity
    end
  end

  def create
    # first check if user exists
    @existing_user = User.find_by mobile_number: params['mobile_number']
    render json: @existing_user and return if @existing_user

    # create the new user
    @user = User.new({
                       mobile_number: params['mobile_number'],
                       password: params['password'],
                       password_confirmation: params['password'] # skip confirmation, just make password reset easy
                     })
    if @user.save
      @user.receiptz_token = jwt_encode(user_id: @user.id) # add JWT Token

      puts @user.receiptz_token
      render json: @user, status: :created
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:token).permit(:mobile_number, :password)
  end

  def prepare_params!
    request.parameters.deep_transform_keys!(&:underscore)
  end
end
