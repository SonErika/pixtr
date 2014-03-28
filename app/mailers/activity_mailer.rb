class ActivityMailer < ActionMailer::Base
  
  default from: 'notifications@example.com'
 
  def activity_email(subject)
    @activity = subject
   
    mail(to: @activity.user.email, subject: 'Welcome to My Awesome Site')
  end
end
