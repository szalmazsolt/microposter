class User < ApplicationRecord

  before_save :downcase_email

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, 
              presence: true, 
              length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  
  private

    def downcase_email
      self.email = email.downcase
    end
end
