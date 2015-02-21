class CreateSubscriptionItems < ActiveRecord::Migration
  def change
    create_table :subscription_items do |t|
      t.integer :subscription_id
      t.integer :item_id

      t.timestamps
    end
  end
end
