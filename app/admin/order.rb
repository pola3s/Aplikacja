ActiveAdmin.register(Order) {

  permit_params :state, :created_at, :user, :subscription, :order_subscription, :subscription_id

  menu :priority => 3
  actions :index, :show, :edit, :update, :destroy
  filter :total
  filter :created_at

  index do
    column("Zamówienie", :sortable => :id) {|order| link_to "#{order.id}" }
    #column "Pozycje" do |order|
    #  link_to order.order_subscriptions, admin_subscriptions(subscription)
    #  end
    column("Data", :created_at )
    column("Klient", :user )
    column("Suma", :total )
    column("Pozycje", :order_subscription )
    actions
  end


  form do |f|
    f.inputs "Prenumerata" do
      if f.object.state == 'oczekujące'
        f.input :state, :label => 'Zmień status', as: :select, collection: ['opłacone', 'wysłane']
      elsif f.object.state == 'opłacone'
        f.input :state, :label => 'Change state', as: :select, collection: ['wysłane']
      end
    end
    f.actions
  end


  show do
    panel "Informacje" do
      table_for(order.order_subscriptions) do |t|
        t.column("Ilość", :count)
        t.column("Tytuł", :subscription)
      end
    end
  end

}