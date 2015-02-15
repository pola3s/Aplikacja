ActiveAdmin.register(Cart) {

  permit_params :subtotal, :state, :number, :completed_at, :user_id, :shipping, :order_total

  #menu :priority => 3
  #actions :index, :show, :edit, :update
  filter :total
  filter :created_at
  scope :all, :default => true
  scope :in_progress
  scope :in_delivery

  index do
  column("Zamówienie", :sortable => :id) {|cart| link_to "#{cart.id}" }
    column("Data", :created_at )
    column("Klient", :user )
    column("Suma", :total )
    column("Stan") {|cart| status_tag(cart.state) }
    actions
    #actions defaults: true do |cart|
    #  link_to 'Change status',
    #          carts_path(cart.id)
    #  end
  end

  #index do
  #  column(:id) { |cart|
  #    content_tag :nobr do
  #      link_to "##{cart.id} ", admin_cart_path(cart)
  #    end
  #  }
  #  column("Stan") { |cart| status_tag(cart.state) }
  #  column(:created_at, :sortable => false)
  #  column(:user, :sortable => false)
  #  column(:total_price) { |cart|
  #    number_to_currency cart.total_price
  #  }
  #  column { |cart|
  #    link_to "Zmień status", admin_cart_path(cart), :method => :edit
  #  }
  #  end

  form do |f|
    f.inputs "Order" do
      if f.object.state == 'in_progress'
        f.input :state, :label => 'Change state', as: :select, collection: ['in_progress', 'waiting']
      elsif f.object.state == 'waiting'
        f.input :state, :label => 'Change state', as: :select, collection: ['waiting', 'in_delivery']
      elsif f.object.state == 'in_delivery'
        f.input :state, :label => 'Change state', as: :select, collection: ['in_delivery', 'delivered']
      elsif f.object.state == 'delivered'
        f.input :state, :disabled => true
      end
    end
    f.actions
  end


  show do
    panel "Informacje" do
      table_for(cart.cart_items) do |t|
        t.column("Magazyn") { |item| item.item_id }
        t.column("Tytuł", :item)
        t.column("Cena") { |item| number_to_currency item.price, :unit => "zł" }
        tr :class => "odd" do
          td
          td "Total:", :style => "text-align: right;"
          td number_to_currency(cart.total, :unit => "zł")
        end
      end
    end
  end

  sidebar :customer_information, :only => :show do
    attributes_table_for cart.user do
      row("Użytkownik") { auto_link cart.user }
      row :email
      row :name
      row :surname
      row :street
      row :postcode
      row :city
      row :phone
    end
  end


}
