class DashboardsController < ApplicationController
  before_action :authorize 

  def show
    @activities = current_user.activities.includes(:subject, :actor, :target)
  end

end 