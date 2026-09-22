class Repair < ApplicationRecord
    belongs_to :bike
    belongs_to :staff, optional: true
    has_many :repair_services, dependent: :restrict_with_error
    has_many :services, through: :repair_services, dependent: :restrict_with_error
    enum :status, {
        received: "received",
        diagnosing: "diagnosing",
        awaiting_approval: "awaiting approval",
        approved: "approved",
        declined: "declined",
        in_progress: "in progress",
        ready: "ready",
        picked_up: "picked up"
    }
    scope :open, -> { where(picked_up_at: nil) }
    scope :overdue, -> { open.where("promised_on < ?", Date.current) }
    scope :newest_first, -> { order(received_at: :desc) }

    validates :bike_id, :received_at, :promised_on, :status, presence: true
    validate :dates_are_consistent
    validate :status_is_consistent

    def dates_are_consistent
        return if received_at.nil?

        if promised_on && promised_on < received_at.to_date
            errors.add(:promised_on, "cannot be before the received date")
        end
        if picked_up_at && picked_up_at.to_date < received_at.to_date
            errors.add(:picked_up_at, "cannot be before the received date")
        end
    end

    def status_is_consistent
        if picked_up_at.present? && !picked_up?
            errors.add(:picked_up_at, "must be empty until the repair is picked up")
        end

        if approved? || declined? || in_progress? || ready? || picked_up?
            if approval_status.blank?
                errors.add(:approval_status, "must be recorded after the customer responds")
            end
        end
    end

    def overdue?
        promised_on.present? &&
            promised_on < Date.current &&
            picked_up_at.nil?
    end

    def total
        repair_services.sum { |line| line.price_charged }
    end
end
