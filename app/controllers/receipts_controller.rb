class ReceiptsController < ApplicationController

  def index
    @receipts = Receipt.all
    authorize @receipts
  end

end
