class Sketch < ApplicationRecord
    has_many :votes
    has_one_attached :image
    validates :image, presence: true
end
