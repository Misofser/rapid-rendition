class Challenge < ApplicationRecord
  has_many :sketches
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def sketch_ratings
    sketches.joins(:votes)
           .group('sketches.id')
           .select('sketches.*, AVG(votes.value) AS average_rating')
           .order('average_rating DESC')
  end

end
