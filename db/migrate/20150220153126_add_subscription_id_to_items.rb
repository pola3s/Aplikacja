class AddSubscriptionIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :subscription_id, :integer
  end
end
