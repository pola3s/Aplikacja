class AddStatesToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :state, :string
  end
end
