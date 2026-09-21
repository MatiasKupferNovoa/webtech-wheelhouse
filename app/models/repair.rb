class Repair < ApplicationRecord
    belongs_to :bike
    belongs_to :staff, optional: true
    has_many :repair_services, dependent: :restrict_with_error
    has_many :services, through: :repair_services, dependent: :restrict_with_error
end
