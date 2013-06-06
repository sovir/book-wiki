class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password
	has_many	:loved_books,	dependent:	:destroy

	has_and_belongs_to_many	:chapters

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :password, presence: true
	validates_confirmation_of :password
	validates :password_confirmation, presence: true

	validates :name, presence: true, length: {maximum:18}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format:{with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }

	private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
