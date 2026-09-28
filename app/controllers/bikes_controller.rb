class BikesController < ApplicationController
  before_action :set_bike, only: [ :show, :edit, :update, :destroy ]

  def index
    @bikes = Bike.includes(:customer).by_brand
  end

  def show
    @repairs = @bike.repairs.includes(bike: :customer).newest_first
  end

  def new
    if params[:customer_id].present?
      @customer = Customer.find(params.expect(:customer_id))
      @bike = @customer.bikes.build
    else
      @bike = Bike.new
    end
  end

  def edit
  end

  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      redirect_to @bike, notice: "Bike #{@bike.serial_number} was created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: "Bike #{@bike.serial_number} was updated."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    if @bike.destroy
      redirect_to bikes_path, status: :see_other, notice: "Bike #{@bike.serial_number} was deleted."
    else
      redirect_to @bike, status: :see_other, alert: "Bike #{@bike.serial_number} could not be deleted: #{@bike.errors.full_messages.to_sentence}"
    end
  end

  private

  def set_bike
    @bike = Bike.includes(:customer).find(params[:id])
  end

  def bike_params
    params.expect(bike: [ :customer_id, :brand, :model, :color, :serial_number ])
  end
end
