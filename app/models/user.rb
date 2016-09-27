class User < ActiveRecord::Base

  validates :username, presence: true,
                       length: {minimum: 4},
                       uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 6, maximum: 72 },
                       allow_nil: true

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Returns the hash digest of the given string.
  #def User.digest(string)
  #  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                BCrypt::Engine.cost
  #  BCrypt::Password.create(string, cost: cost)
  #end
end
