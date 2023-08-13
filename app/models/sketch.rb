class Sketch < ApplicationRecord
    belongs_to :user
    belongs_to :challenge
    has_many :votes, :dependent => :destroy
    has_one_attached :image
    validates :image, presence: true

    
    def position_in_rankings
        ranking = challenge.sketch_ratings
        index = ranking.index(self)
        index ? index + 1 : "Unfortunately, there are currently no votes for this sketch, and it has not been ranked in the competition yet."
    end

end
