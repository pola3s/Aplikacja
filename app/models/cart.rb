class Cart < ActiveRecord::Base

  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  scope :in_progress, ->{where("carts.status IS NULL")}
  scope :complete, -> {where("carts.status IS NOT NULL")}

  COMPLETE = "complete"
  IN_PROGRESS = "in_progress"

  def self.find_with_item(item)
    return [] unless item
    complete.joins(:cart_items).
        where(["cart_items.product_id = ?", item.id]).
        order("carts.checked_out_at DESC")
  end

  def state
    status.nil? ? IN_PROGRESS : COMPLETE
  end



  def total_price
    self.cart_items.inject(0){|s,i| s + i.price }
  end
end
