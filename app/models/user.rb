class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password
  before_save { self.email = email.downcase }

  validates_presence_of :name
  validates_presence_of :address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  has_secure_password
  # validates_presence_of :password, :on => :create
  # validates_confirmation_of :password

  geocoded_by :address
  after_validation :geocode #auto-fetch coordinates




  def self.authenticate(email, password)
    user = find_by(:email => email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user #authentication succeeded
    else
      nil #authentication has failed
    end
  end


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      #password_hash contains the encrypted version of the password
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
