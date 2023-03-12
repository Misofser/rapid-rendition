class Challenge < ApplicationRecord
  has_many :sketches
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
