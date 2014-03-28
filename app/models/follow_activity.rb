class FollowActivity < Activity

  def email
    subject.follower.email
  end 
  
  def follow
    subject.followed_user
  end

  def follow_name
    follow.email
  end 

end
