class CommentsController < ApplicationController
  
  def create
    image = Image.find(params[:image_id])
    @comment = image.comments.create(comment_params)
    #I made comment an instant variable so that it would get it at the instance neccessary.
    if @comment.save
    notify_followers(comment, image)     
    #here I took off the redirect because I did not want it to redirect, instead I wanted it to refresh. 
    else 
      redirect_to image, alert: "Your comment is empty" 
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body).
    merge(user_id: current_user.id)
  end  
end