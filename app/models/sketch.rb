class Sketch < ApplicationRecord
    has_many :comments
    has_one_attached :image
    validates :image, presence: true
end
