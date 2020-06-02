class User < ApplicationRecord
    has_many :startups
    has_many :categories, through: :startups 
end
