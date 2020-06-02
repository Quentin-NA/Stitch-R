class CreateJoinTable < ActiveRecord::Migration[6.0]
  create_join_table :supplier_searches, :users do |t|
    t.index :supplier_search_id
    t.index :user_id
  end
end
