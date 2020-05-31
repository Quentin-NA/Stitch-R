class ReceiptsController < ApplicationController

  def new
    @receipt = Receipt.new
    authorize @receipt
  end

  def create
      if @receipt.save
        redirect_to supplier_search_receipts
      else
        redirect_to_supplier_searches
      end
    authorize @receipt
  end

  def index
    @supplier_search = SupplierSearch.find(params[:supplier_search_id])
    message_ids = GmailApi::ListUserMessages.new(current_user).call(@supplier_search.query)
    message_ids.each do |id|
      metadatas = ["from", "subject", "date"]
      headers = GmailApi::GetUserMessageHeaders.new(current_user, message.id, metadatas).call
      # store headers[].value to each header (from, subject, date)
      # /!\ issue = headers don't seem to have a fixed position ... in api response
      # must build hashes to be able to store them under the appropriate label

    @receipt = Receipt.new(receipt_params)
    raise
  #   @messages = get_messages(query)
  #   @receipts = policy_scope(Receipt)
  #   authorize @supplier_search_id
  end

private

def get_headers_from_messages
  @messages_headers = []
end

private

  def receipt_params
    params.require(:receipt).permit(:from, :subject, :date, :snippet, :supplier_search_id)
  end

end
