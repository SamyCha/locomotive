# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

validates :comment, presence: true, length: { maximum: 120 }
validates :product_id, presence: true
end
