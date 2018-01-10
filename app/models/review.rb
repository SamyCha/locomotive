# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

validates :comment, presence: true, length: { maximum: 50 }
validates :star, presence: true
validates :product_id, presence: true
validates :password, presence: true
end
