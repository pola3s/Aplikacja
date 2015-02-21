class SubscriptionItem < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :item

end
