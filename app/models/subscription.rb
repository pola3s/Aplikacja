class Subscription < ActiveRecord::Base

  has_many :order_subscriptions
  has_many :states
  has_many :items

end
