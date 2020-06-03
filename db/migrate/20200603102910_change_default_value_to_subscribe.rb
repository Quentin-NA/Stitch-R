class ChangeDefaultValueToSubscribe < ActiveRecord::Migration[6.0]
  def change
    change_column_default :supplier_searches, :subscribe, true
  end
end
