class AddAttachmentNamesToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :attachment_names, :string, array: true
    add_index :receipts, :attachment_names, using: 'gin'
  end
end
