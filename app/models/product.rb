# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  validates :category, presence: true
  validates :state, presence: true
  validates :color, presence: true
  validates :brand, presence: true
  validates :size, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 70 }
  validates :address, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 1 }
  validates :status, inclusion: { in: [true, false] }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  include PgSearch
  pg_search_scope :search_by_name_and_category, against: %i[name category brand],
                                                using: {
                                                  tsearch: {
                                                    prefix: true
                                                  }
                                                }

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
