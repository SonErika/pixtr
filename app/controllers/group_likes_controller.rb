class GroupLikesController < ApplicationController

 def create
    @group = Group.find(params[:id])
    current_user.like @group 
    render :change
  end

def destroy 

  @group = Group.find(params[:id]) 
  current_user.unlike @group
  render :change

  end
end 