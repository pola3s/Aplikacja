class AddSubscriptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :subscription, :integer
  end
end
