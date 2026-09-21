class Staff < ApplicationRecord
    has_many :repairs, dependent: :restrict_with_error
end
