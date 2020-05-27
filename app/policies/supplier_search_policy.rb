class SupplierSearchPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      record.user == user
    end

    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end
end
