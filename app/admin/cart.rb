ActiveAdmin.register Cart do


  menu :priority => 3
  actions :index, :show, :delete
  filter :total
  filter :created_at
  scope :all, :default => true
  scope :in_progress
  scope :complete


  index do
    column("Zamówienie", :sortable => :id) {|cart| link_to "#{cart.id}" }
    column("Data", :checked_out_at )
    column("Klient", :user )
    column("Suma", :total )
    column("Stan") {|cart| status_tag(cart.state) }
    actions defaults: true do |cart|
      link_to 'Change status',
              carts_path(cart.id)
      end
  end


  show do
    panel "Informacje" do
      table_for(cart.cart_items) do |t|
        t.column("Magazyn") {|item| item.item_id }
        t.column("Tytuł", :item )
        t.column("Cena") {|item| number_to_currency item.price, :unit => "zł" }
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


end
