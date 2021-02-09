class CreatePreparations < ActiveRecord::Migration[5.2]
  def change
    create_table :preparations do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :order_price
      t.integer :make_status
      t.timestamps
    end
  end
end
