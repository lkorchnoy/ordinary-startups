class Category < ApplicationRecord
    has_many :startups 
    has_many :users, through: :startups
    
    accepts_nested_attributes_for :startups 
end
