class ReceiptsController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @receipts = policy_scope(Receipt)
    # authorize @receipts
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
    @receipt.save
    flash[:notice] = "Le reçu a bien été envoyé"
    redirect_to supplier_search_path(@receipt.supplier_search)
  end
  
end
