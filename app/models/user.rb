class User < ApplicationRecord

    has_secure_password
    has_many :sketches, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    has_many :challenges

    validates :email, presence: true, uniqueness: true

    def admin? 
        self.role == 'admin'
    end

    def full_name
        "#{first_name} #{last_name}"
    end    

end
