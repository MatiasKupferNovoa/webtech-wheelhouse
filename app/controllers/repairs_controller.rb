class RepairsController < ApplicationController
  before_action :set_repair, only: [ :show, :edit, :update, :destroy ]

  def index
    @repairs = Repair.includes(bike: :customer).newest_first
  end

  def show
    @repair_services = @repair.repair_services.includes(:repair, :service).by_service
  end

  def new
    if params[:bike_id].present?
      @bike = Bike.find(params.expect(:bike_id))
      @repair = @bike.repairs.build
    else
      @repair = Repair.new
    end
    3.times { @repair.repair_services.build }
  end

  def edit
    3.times { @repair.repair_services.build }
  end

  def create
    @repair = Repair.new(repair_params)

    if @repair.save
      redirect_to @repair, notice: "Repair ##{@repair.id} was created."
    else
      3.times { @repair.repair_services.build } if @repair.repair_services.empty?
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @repair.update(repair_params)
      redirect_to @repair, notice: "Repair ##{@repair.id} was updated."
    else
      3.times { @repair.repair_services.build } if @repair.repair_services.empty?
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    if @repair.destroy
      redirect_to repairs_path, status: :see_other, notice: "Repair ##{@repair.id} was deleted."
    else
      redirect_to @repair, status: :see_other, alert: "Repair ##{@repair.id} could not be deleted: #{@repair.errors.full_messages.to_sentence}"
    end
  end

  private

  def set_repair
    @repair = Repair.includes(:staff, :repair_services, bike: :customer).find(params[:id])
  end

  def repair_params
    params.expect(repair: [
      :bike_id,
      :staff_id,
      :received_at,
      :promised_on,
      :approval_status,
      :status,
      :ready_at,
      :picked_up_at,
      repair_services_attributes: [
        [ :id, :service_id, :price_charged, :_destroy ]
      ]
    ])
  end
end
