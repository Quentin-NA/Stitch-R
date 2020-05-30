class AddColumnsToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :from, :string, null: false
    add_column :receipts, :subject, :string, null: true
    add_column :receipts, :snippet, :string, null: true
    add_column :receipts, :date, :datetime, null: false
  end
end
