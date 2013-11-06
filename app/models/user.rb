class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :message => "You need an email"
  validates_presence_of :email, :on => :create, :message => "Please enter your email"
  validates_uniqueness_of :email, :on => :create, :message => "Email taken"

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
