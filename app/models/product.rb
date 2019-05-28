class Product < ApplicationRecord

  belongs_to :category
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :chats, dependent: :destroy

  mount_uploader :image, ImageUploader
end
