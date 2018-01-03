# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :start_time, presence: true

end
