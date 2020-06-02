class SupplierSearchesUsersController < ApplicationController
  def index
    @supplier_searches_user = policy_scope(SupplierSearchesUser)
    @supplier_searches = SupplierSearch.all
  end
end
