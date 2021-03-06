class User < ActiveRecord::Base
  # before_create { generate_token(:auth_token) }

  attr_accessor :password # keeps the plain text password in an instance variable before encryption
  before_save :encrypt_password
  before_save { self.email = email.downcase }

  validates_presence_of :name
  # validates_presence_of :address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates_presence_of :password, :on => :create unless ->(user){ self.provider.present? }
  validates_confirmation_of :password

  geocoded_by :address
  after_validation :geocode, if: ->(user){ user.address.present? and user.address_changed? } #auto-fetch coordinates

  # groupify gem
  acts_as_group_member
  acts_as_named_group_member

  scope :sorted, lambda { order("users.name ASC") }

  #self-association
  #need? :dependent => :destroy
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key =>"friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user





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


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      # user.email = result.data.email
    end
  end


def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end


end
