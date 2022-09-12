class User < ApplicationRecord
    has_many :solutions
    has_many :algorithms, through: :solutions
end
