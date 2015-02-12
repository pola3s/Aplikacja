ActiveAdmin.register Cart do
  permit_params :user_id, :total, :created_at, :updated_at, :user_name, :magazine

  menu :priority => 3
  actions :index, :show
  filter :total
  filter :created_at
  scope :all, :default => true
#  scope :in_progress
# scope :complete

  # index do
 #   selectable_column
 #   id_column
 #   column :user
 #   column :magazine
 #   column :total
 #   column :created_at

 #   actions
 # end


  index do
    column("Order", :sortable => :id) {|cart| link_to "#{cart.id}" }
    column("Date", :created_at )
    column("Klient", :user => :id )
    column("Total", :total )
    column("State") #{|cart| status_tag(cart.state) }
    actions
  end

  show do

  end

  sidebar :customer_information, :only => :show do
    attributes_table_for cart.user do
      row("User") { auto_link cart.user }
      row :email
    end
  end


end
