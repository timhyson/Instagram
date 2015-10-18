class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  validates :user, uniqueness: { scope: :photo, message: "has commented on this photo already" }

  has_many :endorsements
end
