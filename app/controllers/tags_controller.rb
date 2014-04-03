class TagsController < ApplicationController

  def show 
    @tag = Tag.find(params[:id])
    @images = @tag.images.includes(galery: [:user])
  end

end