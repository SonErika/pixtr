class GalleryActivity < Activity
  def email
    subject.user.email
  end
    
    def gallery
    subject
  end

  def gallery_name
    subject.name
  end
  
end
