class ListSub < ActiveRecord::Base
  belongs_to :list
  belongs_to :sub
  validates :count, numericality: true

  def price
    self.sub.price * count
  end
end