# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_one :payment
  accepts_nested_attributes_for :payment
end
