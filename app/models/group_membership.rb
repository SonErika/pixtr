class GroupMembership < ActiveRecord::Base

has_many :activities, as: :subject, dependent: :destroy
belongs_to :member, class_name: "User" 
belongs_to :group

  validates :member_id,
  uniqueness: { scope: :group }

end
