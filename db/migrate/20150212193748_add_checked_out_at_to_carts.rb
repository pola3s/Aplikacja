class AddCheckedOutAtToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :checked_out_at, :datetime
  end
end
