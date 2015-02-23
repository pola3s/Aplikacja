class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :roles

  scope :koordynator, -> { where(role: 'Koordynator') }

  validates_length_of :name, :minimum => 2
  validates_length_of :surname, :minimum => 2
  validates_length_of :phone, :minimum => 7
  validates_length_of :city, :minimum => 2
  validates :postcode, format: { with: /\A[0-9]{2}-[0-9]{3}\z/, message: "Niepoprawny kod pocztowy!" }
  validates :email, format: { with: /\A[a-zA-Z0-9.\-_]+@[a-zA-Z0-9\-.]+\.[a-zA-Z]{2,4}\z/, message: "Niepoprawny adres email pocztowy!" }


  #before_save :default_role

  #private
  #def default_role
  #  self.role = ['klient']
  #end

end
