class ReceiptPolicy < ApplicationPolicy
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

  def share?
    record.user == user
  end

  def dismiss?
    record.user == user
  end

end
