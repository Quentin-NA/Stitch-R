class SupplierSearchesController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @searches = policy_scope(SupplierSearch)
    # authorize @receipts
  end

  def new
    @user = current_user
    @search = SupplierSearch.new
    authorize @search
  end

  def create
    @search = SupplierSearch.new(search_params)
    @search.user = current_user
    if save
      redirect_to user_supplier_searches_path
    else
      render :new
    end
  end

  private

  def search_params
    params.require(:supplier_search).permit(:from, :keyword, :category)
  end

end
