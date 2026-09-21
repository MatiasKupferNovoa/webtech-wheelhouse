class Staff < ApplicationRecord
    has_many :repairs, dependent: :restrict_with_error
    scope :by_name, -> { order(:name) }

    validates :name, :role, presence: true
end
