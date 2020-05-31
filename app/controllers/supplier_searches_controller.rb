class SupplierSearchesController < ApplicationController

  def index
    @searches = policy_scope(SupplierSearch)
    @supplier_searches = SupplierSearch.all
  end

  def show
    @supplier_search = SupplierSearch.find(params[:id])
    query = @supplier_search.query
    @messages = GmailApi::ListUserMessages.new(current_user).call(query)
    @metadatas = ["subject", "date"]
    # @message_headers = GmailApi::GetUserMessageHeaders.new(current_user, message.id, @metadatas)
    # this should be an array of hashes message_id=>(key=>value) for each @metadata
    # the view should iterate on these + GetMessage.call.snippet
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
  end

  def supplier_id
    @supplier_search = current_user
  end

  private

  def search_params
    params.require(:supplier_search).permit(:from, :category, :keyword, :subject, :contains, :not_contains, :start_date, :end_date, :label, :attachment)
  end
end

  # Trials & errors to retrieve headers =

  # retrieving headers based on index doesn't work ... (as index of attributes varies per supplier)
    # @date = @message.payload.headers[15].value
    # @from = @message.payload.headers[16].value
    # @subject = @message.payload.headers[20].value
    # @snippet = @message.snippet
  # = Try to build a @label=>@value hash per header ...

    # @messages.each do |message|
    #   headers = GmailApi::GetUserMessageHeaders.new(current_user, message.id, @metadatas).call
    #   date = headers[0].value
    #   from = headers[1].value
    #   subject = headers[2].value
    #   snippet = GmailApi::GetUserMessage.new(current_user, message.id).call.snippet
    # end

  # def headers_to_hash
    # @header_objects = []
    # @header_objects.each do |header|
    #   @label = header.name
    #   @content = header.value
    #   @header_hashed = "{'#{@label}'"+"=>"+"'#{@value}'}"
    #   @headers_hashed << @header_hashed
    # end

    # @header_hashed = "#{@label}:'#{@value}'"

    # should create an array of x metadata hashes

