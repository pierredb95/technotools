class Genre < ApplicationRecord
  has_many :vinyls

  validates :name, presence: true, uniqueness: true
end
