class ReceiptsController < ApplicationController
<<<<<<< HEAD
  def index
=======
  
  def index
    # @user = getProfile
    # @receipts = gmail.user.messages
    @receipts = policy_scope(Receipt)
    # authorize @receipts
>>>>>>> 0b86d8f9e4036e9c6ee97717dc70bb9ff9085c25
  end
end
