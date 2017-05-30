class Comment < ApplicationRecord
  has_many :likes, as: :likeable

  belongs_to :user
  delegate :name, to: :user, prefix: true
  belongs_to :post
  scope :new_first, ->{order created_at: :desc}
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.comment.content_length}
end
