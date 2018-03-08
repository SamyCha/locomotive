# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 120 }
  validates :address, presence: true
  validates :youtube_startsecond, numericality: { only_integer: true, greater_than: 1 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

#signifie 'si reviews.count égal 0 alors ça retourne 0 sinon ça retourne la moyenne des notes
  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

#algolia pour les produit publiés uniquement
include AlgoliaSearch
algoliasearch if: :active? do
  attribute :name
end


#utilisé pour faire le rating
def self.search(search)
   where("name LIKE ?", "%#{search}%")
  end

end
