ActiveAdmin.register Sub do

    permit_params :name
    permit_params sub_items_attributes: [:id, :title, :sub_id, :item_id, :_destroy]

    index do
      column :name, :sortable => :name do |sub|
      end

      column :items do |sub|
        table_for sub.items.order('title ASC') do
          column do |item|
            link_to item.title
          end
        end
      end
      actions
    end

    show do |sub|
      attributes_table do
        row :sub
        row :item do |sub|
          sub.items.map { |d| d.title }.join(", ").html_safe
        end
      end
    end

    form do |f|
      f.semantic_errors *f.object.errors.keys
      f.inputs :name
      f.inputs "subs" do
        f.has_many :sub_items, allow_destroy: true do |deg|
        deg.input :item
      end
    end
    f.actions
    end

end

