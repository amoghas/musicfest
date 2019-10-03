class Theme < ApplicationRecord
  has_many :event
  validates :tittle,presence: true
end
