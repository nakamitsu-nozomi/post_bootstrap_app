class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
end