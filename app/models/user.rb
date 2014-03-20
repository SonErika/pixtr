class User < ActiveRecord::Base
  include Clearance::User

  has_many :followed_user_relationships, foreign_key: :follower_id,
  class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships
  
  has_many :followers_relationships, foreign_key: :followed_user_id,
  class_name: "FollowingRelationship"
  has_many :followers, through: :follower_relationships 

  has_many :galleries
  has_many :images, through: :galleries
  has_many :comments, through: :images

  has_many :group_memberships, 
  foreign_key: :member_id
  has_many :groups, 
  through: :group_memberships 

  def follow user
    followed_users << user
  end

  def following? user
    followed_user_ids.include? user.id
  end


  def unfollow user
    followed_users.destroy(user)
  end 

end
