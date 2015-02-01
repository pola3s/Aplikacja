class AddSurnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname,  :string
    add_column :users, :street,   :string
    add_column :users, :postcode, :string
    add_column :users, :city,     :string
    add_column :users, :phone,    :integer
  end
end
