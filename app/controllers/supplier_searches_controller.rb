class SupplierSearchesController < ApplicationController

  def index
    @searches = policy_scope(SupplierSearch)
  end

  def new
    @user = current_user
    @search = SupplierSearch.new
    authorize @search
  end

  def create
    @search = SupplierSearch.create(search_params)
    authorize @search
    @user = current_user
    if @search.save
      redirect_to user_supplier_searches_path
    else
      render :new
    end
  end

  private

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
