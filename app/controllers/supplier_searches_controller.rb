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
    @search = SupplierSearch.create(search_params)
    @keyword = query(search_params)
    authorize @search
    @user = current_user
    if @search.save
      redirect_to user_supplier_searches_path
    else
      render :new
    end
    @keyword = @search[:keyword]
    @keyword = query(search_params)
    raise
  end
  
  private

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end

  def query(search_params)
    label = params[:supplier_search][:label] = "#{@search[:label]}" ? "in:#{@search[:label]} " : ""
    email = params[:supplier_search][:from] = "#{@search[:from]}" ? "from:(#{@search[:from]}) " : ""
    subject = params[:supplier_search][:subject] = "#{@search[:subject]}" ? "subject:(#{@search[:subject]}) " : ""
    contains = params[:supplier_search][:contains] = "#{@search[:contains]}" ? "#{@search[:contains]} " : ""
    not_contains = params[:supplier_search][:not_contains] = "#{@search[:not_contains]}" ? "#{@search[:not_contains]} " : ""
    start_date = params[:supplier_search][:start_date] = "#{@search[:start_date]}" ? "after:#{@search[:start_date]} " : ""
    end_date = params[:supplier_search][:end_date] = "#{@search[:end_date]}" ? "before:#{@search[:end_date]} " : ""
    attachment = params[:supplier_search][:attachment] = "#{@search[:attachment]}" ? "has:attachment" : ""

    start_date.gsub("-","/")
    end_date.gsub("-","/")
    @query_result = "#{label}#{email}#{subject}#{contains}#{not_contains}#{start_date}#{end_date}#{attachment}"
  end
end
