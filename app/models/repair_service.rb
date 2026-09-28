class RepairService < ApplicationRecord
    belongs_to :repair
    belongs_to :service
    scope :by_service, -> { order(:service_id, :repair_id) }

    validates :repair, presence: true
    validates :service_id, presence: true, uniqueness: { scope: :repair_id }
    validates :price_charged, presence: true, numericality: { greater_than: 0 }
end
