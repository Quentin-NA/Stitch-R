class AddColumnToSupplierSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :supplier_searches, :subscribe, :boolean
  end
end
