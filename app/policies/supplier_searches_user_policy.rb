class SupplierSearchesUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end

  end

  def create?
    true
  end

  def subscribe?
    true
  end

  def unsubscribe?
    true
  end
end
