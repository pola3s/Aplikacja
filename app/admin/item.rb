ActiveAdmin.register Item do
  permit_params :title, :signature, :description, :price, :image
  permit_params :name

  index do
    selectable_column
    id_column
    column :title
    column :signature
    column :description
    column :price
    actions
  end

  sidebar :item_stats, :only => :show do
   attributes_table_for resource do
      #row("Total Sold") { Item.find(resource).count }
      row("Ilość sprzedanych"){CartItem.where(:item_id => resource.id).sum(:count) }
      #row("Ilość sprzedanych"){Cart.where(CartItem.ItemId => resource.id).sum(:count)}
      end
  end

  filter :title
  filter :signature
  filter :description
  filter :price

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
      f.input :signature
      f.input :description
      f.input :price
      f.input :image, :required => false, :as => :file
    end
    f.actions
  end


  show do |ad|
    attributes_table do
      row :title
      row :signature
      row :price
      row :image do
        image_tag(ad.image.url(:thumb))
      end
      # Will display the image on show object page
    end
  end
end
