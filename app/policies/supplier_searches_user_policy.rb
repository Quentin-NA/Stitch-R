class SupplierSearchesUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end

    def create?
      true
    end

    def subscribing?
      true
    end

    def not_subscribing?
      true
    end
  end
end
