class ReorderCart < ActiveRecord::Migration
  def change
    remove_column :carts, :item_id
    create_table :cart_items do |t|
      t.references :cart
      t.references :item
      t.integer :count
    end
  end
end
