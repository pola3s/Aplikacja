ActiveAdmin.register Subscription, :as => "Prenumerata" do
  permit_params :name, :description, :price, :item, :subscription_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    actions
  end

  filter :name
  filter :price

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :items, :as => :check_boxes, :collection => Item.all, include_blank: false

    end
    f.actions
  end


 # f.input :unit, :as => :radio, :collection => ItemType.units, include_blank: false


  show do |ad|
    attributes_table do
      row :name
      row :description
      row :price
      panel "Informacje" do
        table_for(item.subscription) do |t|
          t.column("Ilość", :item)
        end
      end
    end
  end

  end
