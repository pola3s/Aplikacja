class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :total
      t.datetime :checked_out_at
      t.string :state

      t.timestamps
    end
  end
end
