class RepairPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present? && (user.owner? || user.counter? || own_repair?)
  end

  def create?
    user.present? && (user.owner? || user.counter?)
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.owner? || (!record.picked_up? && (user.counter? || own_repair?)))
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.owner?
  end

  def destroy_photo?
    user.present? && (user.owner? || (user.counter? && !record.picked_up?))
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.nil?
        scope.none
      elsif user.owner? || user.counter?
        scope.all
      elsif user.mechanic? && user.staff_id.present?
        scope.where(staff_id: user.staff_id)
      else
        scope.none
      end
    end
  end
  
  def permitted_attributes
    if user.owner? || user.counter?
      [
        :bike_id,
        :staff_id,
        :received_at,
        :promised_on,
        :approval_status,
        :status,
        :ready_at,
        :picked_up_at,
        :diagnosis,
        {
          intake_photos: [],
          repair_services_attributes: [
            :id, :service_id, :price_charged, :_destroy
          ]
        }
      ]
    elsif user.mechanic?
      [
        :status,
        :diagnosis,
        { intake_photos: [] }
      ]
    else
      []
    end
  end

  private

  def own_repair?
    user.mechanic? && user.staff_id.present? && record.staff_id == user.staff_id
  end
end