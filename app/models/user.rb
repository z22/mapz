class User < ActiveRecord::Base
  attr_accessor :password
  # before_save :encrypt_password
  # before_save { self.email = email.downcase }

  validates_presence_of :name
  # validates_presence_of :address
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  # validates_presence_of :password, :on => :create
  # validates_confirmation_of :password

  geocoded_by :address
  after_validation :geocode, if: ->(user){ user.address.present? and user.address_changed? } #auto-fetch coordinates

  # has_and_belongs_to_many :groups
  acts_as_group_member
  acts_as_named_group_member


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
    end
    # case auth['provider']
    #   when 'twitter'
    #     user = User.new
    #     user.name = auth["info"]["name"]
    #     user.uid = auth["uid"]
    #     user.provider = auth["provider"]
    #     user.email = "#{user.name}@example.com"
    #     user.password = null
    #     user.save!
    #   end

  end

end
