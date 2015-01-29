class User < ActiveRecord::Base
  
# inverse_of is used so that the requestee has a way to call on the list of users sending the friend request
  has_many :friendship_requests
  has_many :pendingfriends, through: :friendship_requests
  has_many :request_made, class_name: FriendshipRequest
  has_many :request_received, class_name: FriendshipRequest, foreign_key: :friendee_id

#   def requests
#     create a method that will query the database where current_user.id equal to friendee.id
#     @requests = friendship_requests.where(friendee_id: self.id).map(&:user).map(&:name)

#   end

  has_many :friendships
  has_many :friends, through: :friendships


  def add_friend(friendee)
    self.friendships.create({:friendee_id => friendee.id, :user_id => self.id})
  end

  def accept_friend(user)
    self.friendships.create({:friendee_id => user.id, :user_id=> user.id})
  end
# this defines all the friends as an array when called on the user class

  def friends()
    @friends_arr = []
    current_user = User.where(id: self.id)
    friends = current_user[0].friendships
    friends.each do |f|
      @friends_arr.push(f.friendee)
    end
   
    @friends_arr
  end

# this defines people that i have sent requests to so they cannot be possible friends anymore

  def requesters()
    @requesters_arr = []
    current_user= User.where(id: self.id)
    requesters = current_user[0].friendship_requests
    requesters.each do |r|
      @requesters_arr.push(r.friendee)
    end

    @requesters_arr
    # binding.pry

  end  
# this defines people that have sent requests to me so they cannot be possible friends anymore

  def requestees()
    @requestees_arr = []
    current_user= User.where(id: self.id)
    requestees = current_user[0].request_received

    requestees.each do |r|
      @requestees_arr.push(r.user)
    end

    @requestees_arr
    # binding.pry

  end



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
