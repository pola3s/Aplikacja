
class Item < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium =>     "60x100#", :thumb => "60x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end