class GalleriesController < ApplicationController
  before_filter :authorize, except: (:show)
  respond_to :html

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
      notify_followers(@gallery, @gallery)
    else 
      render :new
    end
  end
#current_user.galleries.create(gallery_params)
  def edit
    @gallery = find_gallery
  end

  def update
    @gallery = find_gallery
    @gallery.update(gallery_params)
    respond_with @gallery 
    
  end

  def destroy
   gallery = find_gallery
    gallery.destroy
    redirect_to galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end

  def find_gallery

    current_user.galleries.find(params[:id])
  end 


end
