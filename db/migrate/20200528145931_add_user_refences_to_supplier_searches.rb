class AddUserRefencesToSupplierSearches < ActiveRecord::Migration[6.0]
  def change
    add_reference :supplier_searches, :user, foreign_key: true
  end
end
