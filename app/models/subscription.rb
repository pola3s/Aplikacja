class Subscription < ActiveRecord::Base

  has_many :order_subscriptions
  has_many :items, through: :subscription_items
  has_many :subscription_items
  belongs_to :order

end
