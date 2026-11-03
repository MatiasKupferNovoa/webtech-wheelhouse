class StaffPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present? && user.owner?
  end

  def new?
    create?
  end

  def update?
    user.present? && user.owner?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.owner?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.present?
        scope.all
      else
        scope.none
      end
    end
  end
end