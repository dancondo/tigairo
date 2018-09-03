class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit_avatar?
    record == user
  end

  def create?
    true
  end

  def update?
    record == user
  end
end
