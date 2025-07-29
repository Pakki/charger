class Connector < ApplicationRecord
  validates :station, presence: true

  belongs_to :station

  has_many :sessions, dependent: :destroy

  enum :connector_type, {
    chademo: 1, csscombo2: 2, type2: 3
  }, prefix: true

  enum :state, {
    offline: 1, ready: 2, busy: 3
  }, prefix: true
end
