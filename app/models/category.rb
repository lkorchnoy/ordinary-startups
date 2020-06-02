class Category < ApplicationRecord
    has_many :startups 
    has_many :users, through: :startups
    
end
