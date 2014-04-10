class ImagesController < ApplicationController 
  respond_to :html
  def index
    @images = Image.tagged_with(params[:tag])
    @results = Image.search(params[:search]) 
end

  def new
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    image = find_image
    like = current_user.like image
    notify_followers(like, image)
      redirect_to @image
    end
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = Comment.recent.page(params[:page]).per(2).includes(:user)
    @tags = @image.tags 
  end

  def edit
    @image = current_user.images.find(params[:id])
    @groups = current_user.groups 
  end

  def update
    @image = current_user.images.find(params[:id])
    if @image.update(image_params)
    redirect_to @image

  else
    @groups = current_user.groups
    render :edit
    end
  end

  def destroy
    image = current_user.images.find(params[:id])
    image.destroy
    redirect_to image.gallery
  end

  private

  def image_params
    params.require(:image).permit(
      :name,
      :url,
      :description,
      :tag_list,
      group_ids:[]
    )
  end

  def find_image
    Image.find(params[:id])
end
end 
