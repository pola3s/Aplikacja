class CreateCartSubscriptions < ActiveRecord::Migration
  def change
    create_table :cart_subscriptions do |t|
      t.string :cart_subscriptions
      t.integer :cart_id
      t.integer :item_id
      t.integer :count

      t.timestamps
    end
  end
end
