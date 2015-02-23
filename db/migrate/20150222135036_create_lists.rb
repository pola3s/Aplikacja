class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.float :total
      t.integer :status

      t.timestamps
    end
  end
end
