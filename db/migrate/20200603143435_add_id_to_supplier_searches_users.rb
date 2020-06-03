class AddIdToSupplierSearchesUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :supplier_searches_users, :id, :primary_key
  end
end
