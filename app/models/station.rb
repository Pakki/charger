class Station < ApplicationRecord
  validates :point, presence: true
  belongs_to :point
  has_many :connectors, dependent: :destroy
end
