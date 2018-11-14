class User < ApplicationRecord
  # validates :username, :password_digest, :session_token, presence: true
  # validates :username, :session_token, uniqueness: true

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :enssure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    # user  = User.find(username)
    # if user.password == password
    #   return user
    # end
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    # session_token = SecureRandom::urlsafe_base64
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    # user.session_token = generate_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    # self.password = BCrypt::Password.new(password) #
    @password = password
    # is this the same as self.password
    self.password_digest = BCrypt::Password.create(password)
  end


end
