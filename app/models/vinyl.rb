class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :genre

  has_many :tracks, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo

  has_one_attached :photo

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
