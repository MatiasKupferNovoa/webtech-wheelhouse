class Bike < ApplicationRecord
    belongs_to :customer
    has_many :repairs, dependent: :restrict_with_error
    scope :by_brand, -> { order(:brand, :model, :serial_number) }

    before_validation :normalize_serial_number
    validates :customer_id, :brand, :model, :color, presence: true
    validates :serial_number, presence: true, uniqueness: true

    def normalize_serial_number
        self.serial_number = serial_number.to_s.strip.upcase
    end
    def display_name
        "#{brand} #{model} (#{serial_number})"
    end
end
