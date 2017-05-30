class Post < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user, prefix: true

  scope :new_first, ->{order created_at: :desc}
  has_many :comments
  has_many :likes, as: :likeable
  has_many :notifications, as: :notificationable
  validates :user_id, presence: true
  validates :content_type, presence: true, length:
    {maximum: Settings.post.content_length}
end
