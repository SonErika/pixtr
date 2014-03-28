class LikeActivity < Activity
  
  def email
    subject.user.email
  end 

  def liked_object 
    subject.likable
  end 

  def likable_name
    liked_object.name
  end 


end
