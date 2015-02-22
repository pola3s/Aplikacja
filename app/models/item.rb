class Item < ActiveRecord::Base

  has_many :cart_items
  has_many :sub_items
  has_attached_file :image, :styles => { :medium =>     "60x100#", :thumb => "60x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :title
  accepts_nested_attributes_for :sub_items
  #permit_params sub_ids: []

  end
