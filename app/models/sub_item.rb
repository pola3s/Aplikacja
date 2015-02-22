class SubItem < ActiveRecord::Base
  belongs_to :sub
  belongs_to :item
end