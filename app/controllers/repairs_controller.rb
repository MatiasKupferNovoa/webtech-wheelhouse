class RepairsController < ApplicationController
  before_action :set_repair, only: [ :show, :edit, :update, :destroy, :destroy_photo ]

  def index
    authorize Repair
    @repairs = policy_scope(Repair).includes( bike: :customer, received_by: :staff ).with_attached_intake_photos.with_rich_text_diagnosis_and_embeds.newest_first
  end

  def show
    @repair_services = @repair.repair_services.includes(:repair, :service).by_service
  end

  def new
    authorize Repair
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
    authorize Repair
    @repair = Repair.new(repair_params)
    @repair.received_by = Current.user

    if @repair.save
      redirect_to @repair, notice: "Repair ##{@repair.id} was created."
    else
      3.times { @repair.repair_services.build } if @repair.repair_services.empty?
      render :new, status: :unprocessable_content
    end
  end

  def update
    attributes = repair_params
    photos = attributes.delete(:intake_photos).to_a.reject(&:blank?)

    @repair.assign_attributes(attributes)

    if photos.any?
      @repair.intake_photos = @repair.intake_photos.blobs.to_a + photos
    end

    if @repair.save
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

  def destroy_photo
    photo = @repair.intake_photos.find(params[:photo_id])
    photo.purge
    redirect_to @repair, status: :see_other, notice: "Photo was deleted."
  end
  
  private

  def set_repair
    @repair = Repair.includes( :staff, :repair_services, bike: :customer, received_by: :staff ).with_attached_intake_photos.with_rich_text_diagnosis_and_embeds.find(params[:id])
    authorize @repair
  end

  def repair_params
    permitted_attributes(@repair || Repair)
  end
end
