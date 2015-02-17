class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :roles

  scope :koordynator, -> { where(role: 'Koordynator') }


  #before_save :default_role

  #private
  #def default_role
  #  self.role = ['klient']
  #end

end
