class SupplierSearchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end

  end
  
  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def subscribing?
    true
  end
end
