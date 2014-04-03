class Image < ActiveRecord::Base



  belongs_to :gallery
  has_many :comments, dependent: :destroy

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :group_images, dependent: :destroy
  has_many :groups, through: :group_images

  has_many :likes, as: :likable, dependent: :destroy
  
  validates :name, 
    presence: true 
   
    
  validates :description, presence: true
  validates :url, presence: true

  def user 
    gallery.user
  end

  def tag_list
    tags.map(&:name).join(",")
  end

  def tag_list=(tag_string)
    tag_string.split(",").each do |tag_name|
      Tag.find_or_create_by(name: tag_name.strip.downcase)
    end
      self.tags = tags
  end 
  
  def self.search(search_params)
    query = search_params[:query]
    tags = Tag.search(search_params)
    image_ids = Tagging.where(tag_id: tags).pluck(:image_id)
    where("name ILIKE :query OR description ILIKE :query OR id IN (:image_ids)", query: "%#{query}%", image_ids: image_ids)
  end

  



end
