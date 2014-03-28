class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy

  validates :name,
  presence: true

  validates :user_id,
  presence: true 

  has_many :activities, as: :subject, dependent: :destroy

  has_many :likes, as: :likable, dependent: :destroy
end
