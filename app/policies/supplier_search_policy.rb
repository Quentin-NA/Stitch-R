class SupplierSearchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def share_all_receipts?
    true
  end

  def dismiss_all_receipts?
    true
  end


  def create?
    user
  end

  def destroy?
    record.user == user
  end

  def subscribing?
    true
  end

  def not_subscribing?
    true
  end
end

