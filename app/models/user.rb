class User < ApplicationRecord
    has_secure_password 
    has_many :startups
    has_many :categories, through: :startups 
    validates :name, presence: {message: "can't be blank"}
    validates :email, presence: true, uniqueness: true 
    

end
