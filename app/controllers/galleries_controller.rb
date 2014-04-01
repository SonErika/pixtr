class GalleriesController < ApplicationController
  before_filter :authorize, except: (:show)
  def index
    @galleries = Gallery.all
    @galleries = current_user.galleries
    
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images.includes(gallery: [:user])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    #associate the gallery with the user 
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      current_user.notify(@gallery, @gallery, "GalleryActivity")
      redirect_to @gallery
    else 
      render :new
    end
  end
#current_user.galleries.create(gallery_params)
  def edit
    @gallery = current_user.galleries.find(params[:id])
  end

  def update
    @gallery = current_user.galleries.find(params[:id])
    if @gallery.update(gallery_params)
    redirect_to gallery_path
    else 
      render :edit 
    end
  end

  def destroy
    gallery = current_user.galleries.find(params[:id])
    gallery.destroy
    redirect_to galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
