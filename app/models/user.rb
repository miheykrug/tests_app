class User < ActiveRecord::Base
  before_save { self.login = login.downcase }
  before_create :create_remember_token
  validates :login, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :first_name, :second_name, :email, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar,
                                    :content_type => ["image/jpg", "image/jpeg",
                                                      "image/png", "image/gif"]

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end