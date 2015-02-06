ActiveAdmin.register Cart do
  permit_params :user_id, :total, :created_at, :updated_at, :user_name

  index do
    selectable_column
    id_column
    column :user_id
    column :total
    column :created_at

    actions
  end


  show do |ad|
    attributes_table do


    end
  end

end
