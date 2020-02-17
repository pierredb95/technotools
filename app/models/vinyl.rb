class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :genre

  has_many :bookings
  has_many :reviews, through: :booking
end
