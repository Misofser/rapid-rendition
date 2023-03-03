class Vote < ApplicationRecord
  belongs_to :sketch
  belongs_to :user
end