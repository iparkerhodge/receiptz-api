class ReceiptsController < ApplicationController
  before_action :prepare_params!, only: %i[create]
  def index; end

  def create
    @receipt = Receipt.new(allowed_receipt_params)

    if @receipt.save
      render json: @receipt, status: 200
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  def list
    @user = User.find(params[:user_id])

    unless @user
      render status: unprocessable_entity
      return
    end

    @receipts = @user.receipts
    render json: @receipts, status: 200
  end

  private

  def allowed_receipt_params
    params.require(:receipt).permit(:user_id, :title, :accusee, :image_url, { claims: [] }, :collection_date)
  end

  def prepare_params!
    request.parameters.deep_transform_keys!(&:underscore)
  end
end