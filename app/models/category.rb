class Category < ApplicationRecord
    has_many :startups 
    has_many :users, through: :startups
    validates :name, presence: true 
    scope :search, -> (search) { where('name LIKE ?', "%#{search}%") }
    
    

    

    
end
