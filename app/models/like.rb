class Like < ActiveRecord::Base
  has_many :activities, as: :subject, dependent: :destroy

  belongs_to :likable, polymorphic: true
  belongs_to :user

  validates :likable, presence: true

  #validates :user, presence: true,
  #uniqueness: {scope: :likable}


end
