class User < ActiveRecord::Base

  belongs_to :user
  belongs_to :role
  has_many :tweets

  before_save :set_role
  after_save :set_creator

  validates :username, presence: true,
                       length: {minimum: 4},
                       uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 4, maximum: 72 },
                       allow_nil: true

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def set_role
    self.role ||= Role.user
  end

  def set_creator
    self.user ||= self
  end
end
