class StaffsController < ApplicationController
  before_action :set_staff, only: [ :show, :edit, :update, :destroy ]

  def index
    @staffs = Staff.by_name
  end

  def show
    @repairs = @staff.repairs.includes(bike: :customer).with_attached_intake_photos.with_rich_text_diagnosis_and_embeds.newest_first
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      redirect_to @staff, notice: "Staff member #{@staff.name} was created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @staff.update(staff_params)
      redirect_to @staff, notice: "Staff member #{@staff.name} was updated."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    if @staff.destroy
      redirect_to staffs_path, status: :see_other, notice: "Staff member #{@staff.name} was deleted."
    else
      redirect_to @staff, status: :see_other, alert: "Staff member #{@staff.name} could not be deleted: #{@staff.errors.full_messages.to_sentence}"
    end
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.expect(staff: [ :name, :role ])
  end
end
