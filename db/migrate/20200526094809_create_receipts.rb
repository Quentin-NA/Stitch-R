class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :gmail_id
      t.references :user, null: false, foreign_key: true
      t.references :supplier_search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
