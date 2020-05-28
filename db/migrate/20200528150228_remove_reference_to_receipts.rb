class RemoveReferenceToReceipts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :receipts, :user
  end
end
