class ReceiverPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end

    def create?
      record.user == user
    end

  end
  
  def update?
    record.user == user
  end
  
end
