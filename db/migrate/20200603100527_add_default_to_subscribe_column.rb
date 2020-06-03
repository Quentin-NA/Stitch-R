class AddDefaultToSubscribeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column_default :supplier_searches, :subscribe, false
  end
end
