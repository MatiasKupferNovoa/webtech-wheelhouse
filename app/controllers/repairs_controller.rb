class RepairsController < ApplicationController
  def index
    @repairs = Repair.includes(bike: :customer).newest_first
  end

  def show
    @repair = Repair.includes(:staff, :repair_services, bike: :customer).find(params[:id])
    @repair_services = @repair.repair_services.includes(:repair, :service).by_service
  end
end
