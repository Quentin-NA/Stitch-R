class SupplierSearchesUsersController < ApplicationController
  def index
    @supplier_searches_user = policy_scope(SupplierSearchesUser)
    @supplier_searches = SupplierSearch.all
  end

  def subscribe
    @search = SupplierSearch.find(params[:id])
    @supplier_searches_user = SupplierSearchesUser.new(supplier_search: @search, user: current_user)
    authorize @supplier_searches_user
    @supplier_searches_user.save
    flash[:notice] = "Vous avez ajouté une nouvelle recherche"
    redirect_to supplier_searches_users_path
  end

  def unsubscribe
    @search = SupplierSearch.find(params[:id])
    @search.destroy
    authorize @search
    flash[:notice] = "Vous avez ajouté une nouvelle recherche"
    redirect_to supplier_searches_users_path
  end
end
