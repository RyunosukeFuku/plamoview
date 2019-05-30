class Product < ApplicationRecord
  has_many :likes
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
end
