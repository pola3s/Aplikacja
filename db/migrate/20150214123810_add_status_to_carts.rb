class AddStatusToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :status, :integer
  end
end
