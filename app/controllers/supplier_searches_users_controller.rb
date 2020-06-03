class SupplierSearchesUsersController < ApplicationController
  def index
    @supplier_searches_user = policy_scope(SupplierSearchesUser)
    @supplier_searches = SupplierSearch.all
  end

  def subscribing
    @search = SupplierSearch.find(params[:id])
    authorize @search
    @search.subscribe = true
    @search.save
    flash[:notice] = "Vous avez ajouté une nouvelle recherche"
    redirect_to supplier_searches_users_path

    # @supplier_searches = current_user.supplier_searches
    # if @supplier_searches.empty?
    #   flash[:notice] = "Vous n'avez sauvegardé aucune recherche"
    # else
    #   @supplier_searches << @search
    #   @sub_supplier_searches.each { |sup_search| sup_search.save }
    #   flash[:notice] = "Vous avez ajouté une nouvelle recherche"
    #   redirect_to supplier_searches_users_path
    # end
    # raise
  end

  def not_subscribing
  end

  # def subscribe?
  #   @supplier_searches = SupplierSearch.all
  #   @supplier_searches.subscribe
  #   flash[:notice] = "Vous avez ajouté une nouvelle recherche"
  #   redirect_to supplier_searches_users_path
  # end



  # def subscribe
  #   @search = SupplierSearch.find(params[:id])
  #   @supplier_searches_user = SupplierSearchesUser.new(supplier_search: @search, user: current_user)
  #   authorize @supplier_searches_user
  #   @supplier_searches_user.save
  #   flash[:notice] = "Vous avez ajouté une nouvelle recherche"
  #   redirect_to supplier_searches_users_path
  # end
  
  # def unsubscribe
  #   @supplier_searches_user = SupplierSearch.where(current_user == current_user.id)
  #   @search = SupplierSearch.find(params[:id])
  #   authorize @supplier_searches_user
  #   @supplier_searches_user = @supplier_searches_user.drop(@search.id)
  #   @supplier_searches_user.each { |search| search.save }
  #   flash[:notice] = "Vous avez ajouté une nouvelle recherche"
  #   redirect_to supplier_searches_users_path
  # end
end
