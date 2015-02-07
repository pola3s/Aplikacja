ActiveAdmin.register User, :as => "Customer" do

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :email
    column :created_at
    actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :surname
      row :street
      row :postcode
      row :city

    end
  end


end
