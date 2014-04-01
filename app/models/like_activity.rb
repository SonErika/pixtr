class LikeActivity < Activity
  
  def email
    actor.email
  end 

  def liked_object 
    target
  end 

  def likable_name
    liked_object.name
  end 


end
