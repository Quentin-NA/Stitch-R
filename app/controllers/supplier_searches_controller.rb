class SupplierSearchesController < ApplicationController

  def index
    @searches = policy_scope(SupplierSearch)
    @supplier_searches = SupplierSearch.all
  end

  def show
    @supplier_search = SupplierSearch.find(params[:id])
    query = @supplier_search.query
    @messages = GmailApi::ListUserMessages.new(current_user).call(query)
    @metadatas = ["from", "subject", "date"]
    # @messages.each do |message|
    #   headers = GmailApi::GetUserMessageHeaders.new(current_user, message.id, @metadatas).call
    #   date = headers[0].value
    #   from = headers[1].value
    #   subject = headers[2].value
    #   snippet = GmailApi::GetUserMessage.new(current_user, message.id).call.snippet
    # end
    authorize @supplier_search
  end

  def new
    #@user = current_user
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

  private

  # retrieving headers based on index doesn't work ... (as index of attributes varies per supplier)
    # @date = @message.payload.headers[15].value
    # @from = @message.payload.headers[16].value
    # @subject = @message.payload.headers[20].value
    # @snippet = @message.snippet

  def headers_to_hash
    @headers = []
    @header_obj.each do |header|
      @label = header.name
      @content = header.value
      @header_content << @content #"{#{@label}"=>" + #{@content}}"
    end
  end

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end
