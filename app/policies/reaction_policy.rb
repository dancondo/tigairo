class ReactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def change?
    if record.user
      record.user == user
    else
      user
    end
  end
end
