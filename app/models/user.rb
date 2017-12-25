# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  enum state: %i[client seller]

  validates :pseudo, presence: true, length: { maximum: 50 }
  validates :address, presence: true

  has_many :products
  has_many :reservations
  has_many :reviews

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
        u.pseudo = auth.info.name
        u.provider = auth.provider
        u.uid = auth.uid
        u.email = auth.info.email
        u.image = auth.info.image
        u.password = Devise.friendly_token[0, 20]
      end
    end
  end
end
