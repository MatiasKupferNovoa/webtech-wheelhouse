class BikePolicy < ApplicationPolicy
  def index?
    user.present? && (user.owner? || user.counter?)
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    index?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.owner?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.present? && (user.owner? || user.counter?)
        scope.all
      else
        scope.none
      end
    end
  end
end
