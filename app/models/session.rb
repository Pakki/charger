class Session < ApplicationRecord
  belongs_to :client
  belongs_to :connector
end
