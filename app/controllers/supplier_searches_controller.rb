class SupplierSearchesController < ApplicationController

  def index
    @searches = policy_scope(SupplierSearch)
    @supplier_searches = SupplierSearch.all
  end

  def show
    @supplier_search = SupplierSearch.find(params[:id])
    query = @supplier_search.query
    @messages = GmailApi::ListUserMessages.new(current_user).call(query)
    authorize @supplier_search
  end

  def new
    @user = current_user
    @search = SupplierSearch.new
    authorize @search
  end

  def create
    @search = SupplierSearch.new(search_params)
    @search.user = current_user
    authorize @search
    if @search.save
      redirect_to supplier_searches_path
    else
      render :new
    end
  end

  def update
    @receipt = Receipt.find(params[:id])
    authorize @receipt
    @receipt.update(params[:status])
  end

  private

  def sent
    @supplier_search.status = "Sent"
  end

  def not_sent
    @supplier_search.status = "Not sent"
  end

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
