class JoinActivity < Activity

  def email
    subject.member.email
  end 
  
  def join
    subject.group
  end

  def join_name
    join.name
  end 

end
