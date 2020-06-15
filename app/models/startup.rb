class Startup < ApplicationRecord
    belongs_to :category 
    belongs_to :user 
    validates :company, presence: true 
    validates :innovation, presence: true 
    validates :product, inclusion: { in:[true,false]}
    
    #accepts_nested_attributes_for :categories

    #def startup_attributes=(startup)
        #self.startup = Startup.find_or_create_by(company: startup[:company])
        #self.startup.update(startup)
    #end 
end
