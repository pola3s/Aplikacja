class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  validates :count, numericality: true

  def price
    self.item.price * count
  end
end