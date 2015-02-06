class AddCartToUser < ActiveRecord::Migration
  def change
    add_column :users, :references, :string
  end
end
