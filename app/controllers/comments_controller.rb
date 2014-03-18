class CommentsController < ApplicationController
  
  def create
    image = Image.find(params[:image_id])
    comment = image.comments.create(comment_params)
    if comment.save
    redirect_to image
    else 
      redirect_to image, alert: "Your comment is empty" 
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to comment.image
  end

  private

  def comment_params
    params.require(:comment).permit(:body).
    merge(user_id: current_user.id)
  end  
end