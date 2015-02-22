class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.references :item, index: true
    end
  end
end
