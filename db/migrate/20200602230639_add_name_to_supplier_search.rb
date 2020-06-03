class AddNameToSupplierSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :supplier_searches, :name, :string
  end
end
