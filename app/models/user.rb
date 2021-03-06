class User < ApplicationRecord
    has_many :tickets
    before_save { self.email = email.downcase }
    before_create :confirmation_token
    validates :name,  presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }   
    has_secure_password
    validates :password, length: { minimum: 6 }
    

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    def ticket_list
        if admin
            Ticket.all
        else
            Ticket.where("user_id = ?", id)
        end            
    end
    

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private

        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
        
        def confirmation_token
            if self.confirm_token.blank?
                self.confirm_token = SecureRandom.urlsafe_base64.to_s
            end
        end
end
