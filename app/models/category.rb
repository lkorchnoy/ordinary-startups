class Category < ApplicationRecord
    has_many :startups 
    has_many :users, through: :startups
    validates :name, presence: true 
    #accepts_nested_attributes_for :startups 

    def startup_attributes=(startup)
        self.startup = Startup.find_or_create_by(company: startup[:company])
        self.startup.update(startup)
    end 
end
