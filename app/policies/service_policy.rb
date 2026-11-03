class ServicePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
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
      scope.all
    end
  end
end