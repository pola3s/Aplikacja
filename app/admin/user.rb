ActiveAdmin.register User do
  permit_params :name, :surname, :street, :postcode, :city, :emai, :phone,

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :pahone
    actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :surname
      row :phone

    end
  end
end
