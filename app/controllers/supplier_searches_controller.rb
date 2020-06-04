class SupplierSearchesController < ApplicationController
  before_action :set_supplier_search, only: [:show, :destroy]

  def index
    @searches = policy_scope(SupplierSearch)
    @supplier_searches = current_user.supplier_searches
  end

  def show
    # StoreSupplierSearchReceipts.new(current_user, @supplier_search).call
    @receipts = @supplier_search.receipts.where(status: "new", user: current_user)
    # @receipts = Receipt.where(supplier_search_id: params[:id]).where(status: "new", user_id: current_user)
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

  def destroy
    @supplier_search.destroy
    redirect_to supplier_searches_path
  end

  private

  def set_supplier_search
    @supplier_search = SupplierSearch.find(params[:id])
    authorize @supplier_search
  end

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
