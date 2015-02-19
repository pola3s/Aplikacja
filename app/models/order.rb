class Order < ActiveRecord::Base

  has_many :order_subscriptions
  has_many :subscriptions, through: :order_subscriptions
  belongs_to :user
  has_many :states


  def total_price
    self.order_subscriptions.inject(0){|s,i| s + i.price }
  end

end
