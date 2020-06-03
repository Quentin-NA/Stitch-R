class ReceiptsController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @receipts = policy_scope(Receipt)
    # authorize @receipts
  end

  def show
    @user = current_user
    @receipt = Receipt.find(params[:id])
    @gmail_message = GmailApi::GetUserMessage.new(@user, @receipt.gmail_id).call
    binding.pry
    authorize @receipt
  end

  def dismiss
    @receipt = Receipt.find(params[:id])
    authorize @receipt
    @receipt.status = "dismissed"
    @receipt.save
    flash[:notice] = "Le reçu a bien été ignoré"
    redirect_to supplier_search_path(@receipt.supplier_search)
  end

  def share
    @receipt = Receipt.find(params[:id])
    authorize @receipt
    @receipt.status = "shared"
    @receipt.receiver_id = params[:receiver_id]
    @receipt.save
    flash[:notice] = "Le reçu a bien été envoyé"
    redirect_to supplier_search_path(@receipt.supplier_search)
  end
end
