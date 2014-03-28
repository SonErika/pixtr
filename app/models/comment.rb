class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :image

  validates :body, presence: true
  validates :user, presence: true
  
  has_many :activities, as: :subject, dependent: :destroy

  def self.recent
    order(created_at: :desc)
  end 
end
