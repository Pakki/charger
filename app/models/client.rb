class Client < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates_format_of :phone_number, with: /\A\d{11}\z/
  has_many :sessions, dependent: :destroy
end
