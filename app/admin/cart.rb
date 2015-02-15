ActiveAdmin.register(Cart) {

  permit_params :state, :created_at, :user

  #menu :priority => 3
  actions :index, :show, :edit, :update, :destroy
  filter :total
  filter :created_at
  scope :all, :default => true
  scope :oczekujące
  scope :opłacone
  scope :zakończone


  index do
  column("Zamówienie", :sortable => :id) {|cart| link_to "#{cart.id}" }
    column("Data", :created_at )
    column("Klient", :user )
    column("Suma", :total )
    column("Stan") {|cart| status_tag(cart.state) }
    actions
  end

  form do |f|
    f.inputs "Order" do
      if f.object.state == 'oczekujące'
        f.input :state, :label => 'Zmień status', as: :select, collection: ['opłacone', 'zakończone']
      elsif f.object.state == 'opłacone'
        f.input :state, :label => 'Change state', as: :select, collection: ['zakończone']
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
