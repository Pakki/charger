class Connector < ApplicationRecord
  validates :station, presence: true

  belongs_to :station

  enum connector_type: {
    chademo: 1, csscombo2: 2, type2: 3
  }, _prefix: true

  enum state: {
    offline: 1, ready: 2, busy: 3
  }, _prefix: true
end
