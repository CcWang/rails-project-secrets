class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
   # rename secrets to secrets_like, source means from which model
  has_many :secrets_liked, through: :likes, source: :secret
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email,  presence:true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # validates_confirmation_of :password
  # validates :password, confirmation: true
end

