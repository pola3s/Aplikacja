class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :roles

  scope :klient, -> { where(role: 'klient') }


  #before_save :default_role

  #private
  #def default_role
  #  self.role = ['klient']
  #end

end
