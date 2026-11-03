class PagePolicy < ApplicationPolicy
  def home?
    user.present?
  end

  def visit?
    user.present?
  end

  def about?
    user.present?
  end
end