class ChargeController < ApplicationController
  def index; end

  def create
    @charge = Charge.new(allowed_charge_params)

    if @charge.save
      render json: @charge, status: 200
    else
      render json: @charge.errors, status: :unprocessable_entity
    end
  end

  private

  def allowed_charge_params
    params.require(:charge).permit(:title, :accusee, :image_url, { counts: [] }, :collection_date)
  end
end
