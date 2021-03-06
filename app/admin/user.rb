ActiveAdmin.register(User) {

  permit_params :user, :id, :role
  actions :index, :show, :edit, :update, :destroy
  scope :all, :default => true
  scope :koordynator
  filter :name
  filter :surname



  index do

    column("User", :sortable => :id) {|user| link_to "#{user.email}" }
    column("User") { |user| "#{user.name } " "#{user.surname}" }
    column ("Status") {|user| status_tag(user.role) }
    actions
  end



  show do |ad|
    attributes_table do
      row :name
      row :surname
      row :email
      row :phone
      row :street
      row :postcode
      row :city
      row :role
    end
  end


  #f. collection_select :role, User::ROLES, :to_s, :humanize
  #f.actions


  form do |f|
    f.inputs "User" do
      f.input :role, :label => 'Zmień status', as: :select, collection: ['Koordynator']
      end
      f.actions
  end







}
