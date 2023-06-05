class ReceiptController < ApplicationController
  def index; end

  def create
    @receipt = Receipt.new(allowed_receipt_params)

    if @receipt.save
      render json: @receipt, status: 200
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  private

  def allowed_receipt_params
    params.require(:receipt).permit(:title, :accusee, :image_url, { claims: [] }, :collection_date)
  end
end
