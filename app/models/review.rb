class Review < ApplicationRecord
  belongs_to :booking

  validates :name, :rating, presence: true
end
