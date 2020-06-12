class Startup < ApplicationRecord
    belongs_to :category 
    belongs_to :user 
    validates :company, presence: true 
    validates :innovation, presence: true 
    validates :product, inclusion: { in:[true,false]}
    #scope :disrupt_startups, -> { where(company: true)}
    #default_scope { where state: 'pending' }

    
end
