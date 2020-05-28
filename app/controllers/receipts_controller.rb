class ReceiptsController < ApplicationController

  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @receipts = policy_scope(Receipt)
    # authorize @receipts
  end
end
