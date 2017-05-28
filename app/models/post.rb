class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :likes, as: :likeable
  has_many :notifications, as: :notificationable
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content_type, presence: true, length: {maximum: Settings.post.content_length}
end
