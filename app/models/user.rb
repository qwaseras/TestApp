class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }   
    has_secure_password
    validates :password, length: { minimum: 6 }
end
