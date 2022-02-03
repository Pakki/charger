class Point < ApplicationRecord
  validates :title, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :stations, dependent: :destroy
end
