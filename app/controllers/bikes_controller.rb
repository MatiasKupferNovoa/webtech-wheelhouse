class BikesController < ApplicationController
  def index
    @bikes = Bike.includes(:customer).by_brand
  end

  def show
    @bike = Bike.includes(:customer).find(params[:id])
    @repairs = @bike.repairs.includes(bike: :customer).newest_first
  end
end
