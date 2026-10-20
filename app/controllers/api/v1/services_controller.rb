class Api::V1::ServicesController < Api::V1::BaseController
  before_action :authenticate, only: :create
  def index
    services = Service.includes(:repairs).by_name
    render json: services.map { |service| service_json(service) }
  end

  def show
    service = Service.find(params[:id])
    render json: service_json(service)
  end

  def create
    service = Service.new(service_params)

    if service.save
      render json: service_json(service), status: :created, location: api_v1_service_url(service)
    else
      render json: { errors: service.errors.full_messages }, status: :unprocessable_content
    end
  end

  private

  def service_params
    params.expect(service: [:name, :current_price])
  end

  def service_json(service)
    {
      id: service.id,
      name: service.name,
      price: service.current_price.to_s("F"),
      repairs_count: service.repairs.size
    }
  end
end