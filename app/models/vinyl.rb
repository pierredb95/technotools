class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :genre

  has_many :tracks, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
end
