class Api::V1::RepairsController < Api::V1::BaseController
  before_action :authenticate, only: [:index, :show]
  def index
    repairs = Repair.includes(bike: :customer, repair_services: :service).newest_first

    if params.key?(:state)
      state = params[:state]

      unless Repair.statuses.key?(state)
        raise ActionController::BadRequest, "Invalid state. Available states: #{Repair.statuses.keys.join(', ')}"
      end

      repairs = repairs.where(status: state)
    end

    render json: repairs.map { |repair| repair_json(repair) }
  end

  def show
    repair = Repair.find(params[:id])
    render json: repair_json(repair)
  end

  private

  def repair_json(repair)
    {
      id: repair.id,
      state: repair.status,
      received_on: repair.received_at.to_date,
      promised_on: repair.promised_on,
      picked_up_on: repair.picked_up_at&.to_date,
      bike: {
        brand: repair.bike.brand,
        model: repair.bike.model,
        serial_number: repair.bike.serial_number
      },
      customer: {
        name: repair.bike.customer.name
      },
      lines: repair.repair_services.map do |line|
        {
          service: line.service.name,
          price_charged: line.price_charged.to_s("F")
        }
      end,
      total: repair.total.to_d.to_s("F"),
      overdue: repair.overdue?,
      customer_answer: repair.approval_status.presence || "not_recorded"
    }
  end
end