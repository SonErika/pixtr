class JoinActivity < Activity

  def email
    actor.email
  end 
  
  def join
    target
  end

  def join_name
    join.name
  end 

end
