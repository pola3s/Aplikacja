class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.float :total

      t.timestamps
    end
  end
end
