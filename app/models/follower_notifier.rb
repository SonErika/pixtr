class FollowerNotifier 
  def initialize(user)
    @user = user 
  end 

  def notify(subject, target)
    user.followers.each do |follower|
      follower.activities.create(
          subject: subject,
          type: type(subject),
          actor: user,
          target: target)
        ActivityMailer.activity_email(activities).deliver
      end
    end


private 

  attr_reader :user 

  def type(subject)
  "#{subject.class}Activity"
  end
end 