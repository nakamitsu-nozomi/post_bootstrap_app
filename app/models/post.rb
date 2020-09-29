class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
end