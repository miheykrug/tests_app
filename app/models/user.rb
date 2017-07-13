class User < ActiveRecord::Base
  before_save { self.login = login.downcase }
  validates :login, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :first_name, :second_name, :email, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end