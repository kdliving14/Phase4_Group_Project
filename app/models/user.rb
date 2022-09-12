class User < ApplicationRecord
    has_secure_password
    
    has_many :solutions
    has_many :algorithms, through: :solutions
end
