ActiveAdmin.register Sub do
    permit_params :name
    permit_params sub_items_attributes: [:id, :title, :sub_id, :item_id, :_destroy]

    show do |sub|
      attributes_table do
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

