class Photo < ApplicationRecord
  belongs_to :product

  has_attached_file :image, styles: { medium: "150x150>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
