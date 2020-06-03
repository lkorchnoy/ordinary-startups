class User < ApplicationRecord
    has_many :startups
    has_many :categories, through: :startups 
    validates :name, presence: {message: "can't be blank"}
    validates :email, presence: true, uniqueness: true 
    validates :password, confirmation: true, unless: -> { password.blank? }
has_secure_password 
end
