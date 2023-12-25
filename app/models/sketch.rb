class Sketch < ApplicationRecord
    belongs_to :user
    belongs_to :challenge
    has_many :votes, :dependent => :destroy
    has_one_attached :image
    validates :image, presence: true
    validate :validate_image_size
    before_save :set_custom_filename

    def vote_count
      votes.count
    end

    def position_in_rankings
        ranking = challenge.sketch_ratings
        index = ranking.index(self)
        index ? index + 1 : "Unfortunately, there are currently no votes for this sketch, and it has not been ranked in the competition yet."
    end

    private
  
    def validate_image_size
      if image.attached? && image.blob.byte_size > 5.megabytes
        errors.add(:image, 'File size exceeds the maximum allowed limit (5 MB)')
      end
    end

    def set_custom_filename
      if image.attached?
        filename = "#{SecureRandom.hex(16)}.#{image.filename.extension.downcase}"
        image.blob.update(filename: filename)
      end
    end

end
