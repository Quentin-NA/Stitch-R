class AddImageToReceiver < ActiveRecord::Migration[6.0]
  def change
    add_column :receivers, :image, :string
  end
end
