class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :total
      
      t.references :user, index: true
      t.references :cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :carts
  end
end
