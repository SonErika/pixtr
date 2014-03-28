class User < ActiveRecord::Base
  include Clearance::User

  has_many :followed_user_relationships, foreign_key: :follower_id,
  class_name: "FollowingRelationship", dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships
  
  has_many :follower_relationships, foreign_key: :followed_user_id,
  class_name: "FollowingRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships 

  has_many :galleries, dependent: :destroy
  has_many :images, through: :galleries
  has_many :comments, through: :images
  
  has_many :likes, dependent: :destroy 


  has_many :activities 
 

  has_many :group_memberships, 
  foreign_key: :member_id, dependent: :destroy
  has_many :groups, 
  through: :group_memberships 

  def follow user
    
    following_relationship = followed_user_relationships.create(followed_user: user)
    notify(following_relationship, "FollowActivity")
  end

  def following? user
    followed_user_ids.include? user.id
  end


  def unfollow user
    followed_users.destroy(user)
  end 

   def join group
    group_membership = group_memberships.create(group: group)
      notify(group_membership, "JoinActivity")
  end 

  def leave group
    groups.destroy(group)
  end


  def member? group 

    groups.include? group
  end

   def like target
    like = likes.create(likable: target)
    notify like, "LikeActivity"
  end
  
  def like? target
  like = likes.find_by(likable: target)
    likes.include? like

    # likes.exist?(likable: target)

  end

  def unlike target 

    like = likes.find_by(likable: target)
    like.destroy
  end


  def notify(subject, type) 
    if subject.persisted? 
      followers.each do |follower|
        follower.activities.create(subject: subject, type: type)
        ActivityMailer.activity_email(subject).deliver
      end
    end
  end
end
