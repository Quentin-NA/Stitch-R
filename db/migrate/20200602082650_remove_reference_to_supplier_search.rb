class RemoveReferenceToSupplierSearch < ActiveRecord::Migration[6.0]
  def change
    remove_reference :supplier_searches, :user
  end
end
