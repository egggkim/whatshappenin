class FriendshipRequest < ActiveRecord::Base

  belongs_to :user
  belongs_to :friendee, class_name: "User"

  ###########################ADD A BOOLEAN ON TO THE REQUEST TRUTH/FALSE#######################################
  ###########################OR/ADD ACCEPTED ON DATE.. ONLY EXIST ON TRUE#######################################
  
end
