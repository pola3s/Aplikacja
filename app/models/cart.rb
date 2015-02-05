class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  def total_price
    self.cart_items.inject(0){|s,i| s + i.price }
  end
end
