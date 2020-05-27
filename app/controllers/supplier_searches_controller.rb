class SupplierSearchesController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @searches = policy_scope(SupplierSearch)
    # authorize @receipts
  end

  def new
    @supplier = SupplierSearch.new
    authorize @supplier
  end

  def create
    @supplier = SupplierSearch.new(supplier_params)
    @supplier.user = current_user
    if save
      redirect_to user_supplier_searches_path
    else
      render :new
    end
  end

end
