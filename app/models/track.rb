class Track < ApplicationRecord
  belongs_to :vinyl

  validates :name, presence: true
end
