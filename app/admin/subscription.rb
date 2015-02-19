ActiveAdmin.register Subscription do
  permit_params :name, :description, :price

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
    end
    f.actions
  end


  show do |ad|
    attributes_table do
      row :name
      row :description
      row :price
    end
  end

  end
