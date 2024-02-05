class User < ApplicationRecord
    attr_accessor :current_password

    has_secure_password
    has_many :sketches, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    has_many :challenges

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true, on: :create
    validates :current_password, presence: true, on: :update

    def admin? 
        self.role == 'admin'
    end

    def full_name
        "#{first_name} #{last_name}"
    end
    
end
