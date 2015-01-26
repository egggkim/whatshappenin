class User < ActiveRecord::Base
  
# inverse_of is used so that the requestee has a way to call on the list of users sending the friend request
  has_many :friendship_requests, inverse_of: :user
  has_many :pendingfriends, through: :friendship_requests, inverse_of: :friendee





  has_many :friendships, inverse_of: :user
  has_many :friends, through: :friendships, inverse_of: :friendee






  # has_many :inverse_friendships, class_name => "Friendship", :ftoreign_key =>"friendee_id"
  # has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  attr_reader :password
  # not sure attr_reader belongs here

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      return self
    else
      return false
    end
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length:{in:6..20}, confirmation: true, on: :create
  validates :password, length:{in:6..20}, confirmation: true, on: :update, allow_blank: true
end
