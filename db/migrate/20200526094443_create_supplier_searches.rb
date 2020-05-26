class CreateSupplierSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_searches do |t|
      t.string :from
      t.string :keyword
      t.string :category

      t.timestamps
    end
  end
end
