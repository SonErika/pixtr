class GroupLikesController < ApplicationController

 def create
    @group = Group.find(params[:id])
    like = current_user.like @group 
    notify_followers(like, group)
    render :change
  end

def destroy 

  @group = Group.find(params[:id]) 
  current_user.unlike @group
  render :change

  end
end 