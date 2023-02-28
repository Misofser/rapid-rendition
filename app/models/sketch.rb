class Sketch < ApplicationRecord
    belongs_to :user
    has_many :votes, :dependent => :destroy
    has_one_attached :image
    validates :image, presence: true
end
