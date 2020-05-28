class ChangeColumnNullOfSupplierSearchTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :supplier_searches, :subject, true
    change_column_null :supplier_searches, :contains, true
    change_column_null :supplier_searches, :not_contains, true
    change_column_null :supplier_searches, :label, true
  end
end
