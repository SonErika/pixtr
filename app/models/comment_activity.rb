class CommentActivity < Activity

  def email
    subject.user.email
  end 
  
  def commented_image
    subject.image
  end

  def comment_name
    commented_image.name
  end 

end


