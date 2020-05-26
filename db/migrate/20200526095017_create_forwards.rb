class CreateForwards < ActiveRecord::Migration[6.0]
  def change
    create_table :forwards do |t|
      t.references :receipt, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
