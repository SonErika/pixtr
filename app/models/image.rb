class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments, dependent: :destroy

  has_many :group_images, dependent: :destroy
  has_many :groups, through: :group_images

  has_many :likes, as: :likable, dependent: :destroy
  
  validates :name, 
    presence: true, 
    uniqueness: true
    
  validates :description, presence: true
  validates :url, presence: true

  def user 
    gallery.user
  end


end
