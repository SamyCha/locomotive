# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "armoires.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  validates :name, presence: true
  validates :start_time, presence: true

end
