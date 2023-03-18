class Vote < ApplicationRecord
  belongs_to :sketch
  belongs_to :user

  validate :only_one_vote_per_user_per_sketch

  private

  def only_one_vote_per_user_per_sketch
    if Vote.exists?(user: user, sketch: sketch)
      errors.add(:base, "You have already voted on this sketch")
    end
  end

end