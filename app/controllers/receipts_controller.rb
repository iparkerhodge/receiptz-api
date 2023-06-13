class ReceiptsController < ApplicationController
  before_action :prepare_params!, only: %i[create update delete]
  def index; end

  def create
    unless @current_user
      render json: {}, status: :unauthorized
      return
    end

    @receipt = Receipt.new(allowed_receipt_params)

    if @receipt.save
      render json: @receipt, status: 200
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  def list
    unless @current_user
      render status: :unprocessable_entity
      return
    end

    @receipts = @current_user.receipts.not_deleted.order(:created_at)
    render json: @receipts, status: 200
  end

  def update
    @receipt = Receipt.find(params[:id])

    unless @receipt && @current_user
      render status: :unprocessable_entity
      return
    end

    params['receipt'].each { |k, v| @receipt[k] = v }
    if @receipt.save
      render json: @receipt, status: 200
    else
      render status: :unprocessable_entity
    end
  end

  def delete
    @receipt = Receipt.find(params[:id])

    unless @receipt && @current_user
      render status: :unprocessable_entity
      return
    end

    if @receipt.delete!
      render json: @receipt, status: 200
    else
      render status: :unprocessable_entity
    end
  end

  private

  def allowed_receipt_params
    params.require(:receipt).permit(:user_id, :title, :accusee, :image_url, { claims: [] }, :collection_date)
  end

  def prepare_params!
    request.parameters.deep_transform_keys!(&:underscore)
  end
end
