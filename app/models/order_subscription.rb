class OrderSubscription < ActiveRecord::Base
  belongs_to :order
  belongs_to :subscription


  def price
    self.subscription.price * count
  end
end
