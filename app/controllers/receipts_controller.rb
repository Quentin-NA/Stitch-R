class ReceiptsController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @receipts = policy_scope(Receipt)
    # authorize @receipts
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

end
