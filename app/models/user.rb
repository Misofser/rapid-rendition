class User < ApplicationRecord
    has_secure_password
    has_many :sketches
    has_many :votes
    has_many :challenges
end
