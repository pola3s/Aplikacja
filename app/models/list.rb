class List < ActiveRecord::Base


  has_many :list_subs
  has_many :subs, through: :list_subs
  belongs_to :user
  has_many :states



  #scope :oczekujące, -> { where(state: 'oczekujące') }
  #scope :opłacone, -> { where(state: 'opłacone') }
  #scope :zakończone, -> { where(state: 'zakończone') }




  #def self.find_with_item(item)
  #  return [] unless item
  #  complete.joins(:cart_items).
  #      where(["cart_items.product_id = ?", item.id]).
  #      order("carts.checked_out_at DESC")
  #end

  #def total_price
  #  self.cart_items.inject(0){|s,i| s + i.price }
  #end

end
