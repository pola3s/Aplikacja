class Sub < ActiveRecord::Base
  has_many :sub_items
  has_many :items, :through => :sub_items
  accepts_nested_attributes_for :sub_items, :allow_destroy => true
end