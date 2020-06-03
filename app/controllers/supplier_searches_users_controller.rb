class SupplierSearchesUsersController < ApplicationController
  def index
    @supplier_searches_user = policy_scope(SupplierSearchesUser)
    @supplier_searches = SupplierSearch.all
  end

  def subscribing
    @search = SupplierSearch.find(params[:id])
    authorize @search
    SupplierSearchesUser.create(user: current_user, supplier_search: @search)
    flash[:notice] = "Vous avez ajouté une nouvelle recherche"
    redirect_to supplier_searches_users_path
  end

  def not_subscribing
    skip_authorization
    @search = SupplierSearchesUser.find_by(user: current_user, supplier_search: SupplierSearch.find(params[:id]))
    @search.destroy
    flash[:notice] = "Vous avez supprimé cette recherche"
    redirect_to supplier_searches_users_path
  end
end
