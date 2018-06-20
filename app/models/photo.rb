class Photo < ApplicationRecord
  has_attached_file :image, styles: {galery: "800x600#", high: "600x600#", medium: "300x300#", thumb: "200x120#" }, default_url: "/assets/images/pizza0.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/x
  belongs_to :pizza, optional: true
end
