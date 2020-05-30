class ReceiptsController < ApplicationController

  def new
    @receipt = Receipt.new
    authorize @receipt
  end

  def create

  end

  def index
    @receipts = policy_scope(Receipt)
    @supplier_search = SupplierSearch.find(params[:id])
    query = @supplier_search.query
    @messages = get_messages(query)
    authorize @supplier_search
  end

private

def get_messages(query)
  @messages = GmailApi::ListUserMessages.new(current_user).call(query)
end


end
