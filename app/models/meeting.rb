# frozen_string_literal: true

class Meeting < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :start_time, presence: true

end
