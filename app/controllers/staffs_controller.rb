class StaffsController < ApplicationController
  def index
    @staffs = Staff.by_name
  end

  def show
    @staff = Staff.find(params[:id])
    @repairs = @staff.repairs.includes(bike: :customer).newest_first
  end
end
