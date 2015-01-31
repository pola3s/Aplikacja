class AddPaperclipToItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_url, :string
    add_attachment :items, :image
  end
end
