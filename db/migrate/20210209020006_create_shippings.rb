class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :user_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.timestamps
    end
  end
end
