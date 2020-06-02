class SupplierSearchesController < ApplicationController

  def index
    @searches = policy_scope(SupplierSearch)
    @supplier_searches = current_user.supplier_searches
  end

  def show
    @supplier_search = SupplierSearch.find(params[:id])
    StoreSupplierSearchReceipts.new(current_user, @supplier_search).call
    @receipts = Receipt.where(supplier_search_id: params[:id]).where(status: "new")
    authorize @supplier_search
  end

  def new
    @user = current_user
    @search = SupplierSearch.new
    authorize @search
  end
  
  def create
    @search = SupplierSearch.new(search_params)
    authorize @search
    if @search.save
      @supplier_searches_user = SupplierSearchesUser.create(supplier_search: @search, user: current_user)
      redirect_to supplier_searches_path
    else
      render :new
    end
  end

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
