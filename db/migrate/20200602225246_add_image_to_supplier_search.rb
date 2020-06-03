class AddImageToSupplierSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :supplier_searches, :image, :string
  end
end
