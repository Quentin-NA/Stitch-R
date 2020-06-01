class AddReceiverReferencesToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_reference :receipts, :receiver, foreign_key: true
  end
end
