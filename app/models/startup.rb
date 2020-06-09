class Startup < ApplicationRecord
    belongs_to :category 
    belongs_to :user 
    validates :boolean_field_name, inclusion: { in:[true,false]}
    scope :disrupt_startups, -> { where(disrupt_startups: true)}
    default_scope { where state: 'pending' }

    
end
