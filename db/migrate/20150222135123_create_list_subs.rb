class CreateListSubs < ActiveRecord::Migration
  def change
    create_table :list_subs do |t|
      t.integer :list_id
      t.integer :sub_id
      t.integer :count

      t.timestamps
    end
  end
end
