class SupplierSearchesController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @searches = policy_scope(SupplierSearch)
    # authorize @receipts
  end

  def show
    @supplier_search = SupplierSearch.find(params[:id])
    query = @supplier_search.query
    @messages = GmailApi::ListUserMessages.new(current_user).call(query)

  end

  def new
    @user = current_user
    @search = SupplierSearch.new
    authorize @search
  end

  def create
    @search = SupplierSearch.create(search_params)
    @user = current_user
    if @search.save
      redirect_to user_supplier_searches_path
    else
      render :new
    end
    authorize @search
    @keyword = @search[:keyword]
    @keyword = "#{@search[:subject]}, #{@search[:contains]}, #{@search[:not_contains]}, #{@search[:start_date]}, #{@search[:end_date]}, #{@search[:label]}, #{@search[:attachment]}"
  end

  private

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
