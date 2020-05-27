class AddColumnsToSupplierSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :supplier_searches, :subject, :string, default: '', null: false
    add_column :supplier_searches, :contains, :string, default: '', null: false
    add_column :supplier_searches, :not_contains, :string, default: '', null: false
    add_column :supplier_searches, :start_date, :date
    add_column :supplier_searches, :end_date, :date
    add_column :supplier_searches, :label, :string, default: '', null: false
    add_column :supplier_searches, :attachment, :boolean, default: false
  end
end
