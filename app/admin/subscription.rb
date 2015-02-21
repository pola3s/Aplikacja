ActiveAdmin.register Subscription do

  permit_params :name, :description, :price, :item, :subscription, :subscription_items, :subscription_item

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
    panel "Informacje" do
      table_for(subscription.items) do |t|
        t.column("Tytuł") { auto_link item.title }
      end
    end
  end

  sidebar :subscription_information, :only => :show do
    attributes_table_for subscription do
      row :name
      row :description
      row :price
    end
  end


end


