class Challenge < ApplicationRecord
  has_many :sketches
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
