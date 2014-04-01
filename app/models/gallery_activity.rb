class GalleryActivity < Activity
  def email
    actor.email
  end
    
    def gallery
    target
  end

  def gallery_name
    subject.name
  end
  
end
