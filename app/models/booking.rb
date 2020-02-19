class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl

  has_many :reviews, dependent: :destroy

  validates :start_rent, :end_rent, presence: true
  validate :end_rent_after_start_rent

  validate :validate_other_booking_overlap

  def period
    (:start_rent..:end_rent)
  end

  private
  def end_rent_after_start_rent
    if :end_rent >= :start_rent
      errors.add(:end_rent, "must be after the start date")
    end
  end

  def validate_other_booking_overlap
    other_bookings = Booking.all
    is_overlapping = other_bookings.any? do |other_booking|
      period.overlaps?(other_booking.period) && :vinyl_id == other_booking.vinyl_id
    end
    errors.add(:overlaps_with_other, 'The vinyl is already booked at this period') if is_overlapping
  end
end
