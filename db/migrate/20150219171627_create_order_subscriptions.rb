class CreateOrderSubscriptions < ActiveRecord::Migration
  def change
    create_table :order_subscriptions do |t|
      t.integer :order_id
      t.integer :subscription_id
      t.integer :count

      t.timestamps
    end
  end
end
