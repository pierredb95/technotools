class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl

  has_many :reviews, dependent: :destroy

  validates :start_rent, :end_rent, presence: true
  validate :end_rent_after_start_rent

  private
  def end_rent_after_start_rent
    if :end_rent < :start_rent
      errors.add(:end_rent, "must be after the start date")
    end
  end
end
