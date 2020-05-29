class SupplierSearchesController < ApplicationController

  def index
    @searches = policy_scope(SupplierSearch)
    @supplier_searches = SupplierSearch.all
  end

  def show
    @supplier_search = current_user
    # query = @supplier_search.query
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

    # @keyword = @search[:keyword]
    # @keyword = "#{@search[:subject]}, #{@search[:contains]}, #{@search[:not_contains]}, #{@search[:start_date]}, #{@search[:end_date]}, #{@search[:label]}, #{@search[:attachment]}"
  end

  def supplier_id
    @supplier_search = current_user
  end

  # def count
  #   @receipts_count =
  # end

  private

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
