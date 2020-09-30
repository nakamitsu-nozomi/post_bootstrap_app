class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader

   # post を user が「いいね！」しているときは「true」，「いいね」していないときは「false」
   def liked_by?(user)
    likes.find_by(user_id: user.id).present?
   end
end