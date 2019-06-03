class Product < ApplicationRecord
  has_many :likes
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
  
  validates :name, :description, :category_id, :image, :likes_count, presence: true
  validates :name, length: { maximum: 20 }
  validates :name, length: { maximum: 150 }
end
