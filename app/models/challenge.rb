class Challenge < ApplicationRecord
  has_many :sketches
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def sketch_ratings
    sketches.joins(:votes)
            .group('sketches.id')
            .select('sketches.*, COUNT(votes.id) AS vote_count')
            .order('vote_count DESC')
  end  

end
