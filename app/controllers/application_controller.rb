class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 

  def notify_followers(subject, target)
    notify_user = NotifyFollower.new.(current_user)
    notify_user.notify(subject, target)
  end


end