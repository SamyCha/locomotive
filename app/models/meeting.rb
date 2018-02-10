# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user

 mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :start_time, presence: true

end
