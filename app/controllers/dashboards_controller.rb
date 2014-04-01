class DashboardsController < ApplicationController

 def show
  @activities = current_user.activities.includes(:subject, :target, :actor)
  end

end 