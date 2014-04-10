class ActivitiesController < ActivitiesController

  def create (subject, target, type)
activities = follower.activities.create(
          subject: subject,
          type: type,
          actor: self,
          target: target)
        ActivityMailer.activity_email(activities).deliver

  end 


end 