class ImageLikesController < ApplicationController

 def create
    image = Image.find(params[:id])
    like = current_user.like image
    notify_followers(like, image) 
    redirect_to image 
  end

def destroy 

  image = Image.find(params[:id]) 
  current_user.unlike image
  redirect_to image
  end
end 