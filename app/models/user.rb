class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :email,  length: { maximum: 50 }
end
