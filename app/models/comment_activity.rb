class CommentActivity < Activity

  def email
    actor.email
  end 
  
  def commented_image
    target
  end

  def comment_name
    commented_image.name
  end 

end


