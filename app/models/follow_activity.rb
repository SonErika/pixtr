class FollowActivity < Activity

  def email
    actor.email
  end 
  
  def follow
    target
  end

  def follow_name
    follow.email
  end 

end
