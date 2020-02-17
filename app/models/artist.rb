class Artist < ApplicationRecord
  has_many :vinyls, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
