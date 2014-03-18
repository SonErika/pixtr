class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  
  validates :name, 
    presence: true, 
    uniqueness: true
    
  validates :description, presence: true
  validates :url, presence: true

  def user 
    gallery.user
  end 
end
