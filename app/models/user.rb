class User < ApplicationRecord

    has_secure_password
    has_many :sketches
    has_many :votes
    has_many :challenges

    def admin? 
        self.role == 'admin'
    end

    def full_name
        "#{first_name} #{last_name}"
    end    

end
