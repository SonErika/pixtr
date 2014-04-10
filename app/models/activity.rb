class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, polymorphic: true
  belongs_to :actor, class_name: "User"  
  belongs_to :target, polymorphic: truedef notify(subject, target, actor, type)

  

end
