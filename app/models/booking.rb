class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl

  has_many :reviews
end
