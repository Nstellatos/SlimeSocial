class User < ApplicationRecord

has_many :recipes 


    validates :name, presence: true


before_save { self.email = email.downcase }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true 
  

has_secure_password
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

    
end
