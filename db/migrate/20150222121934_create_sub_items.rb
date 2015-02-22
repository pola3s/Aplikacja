class CreateSubItems < ActiveRecord::Migration
  def change
    create_table :sub_items do |t|
      t.references :sub, index: true
      t.references :item, index: true
    end
  end
end
