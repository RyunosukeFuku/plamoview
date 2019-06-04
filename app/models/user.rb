class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, :email, :encrypted_password, presence: true
  validates :name, :email, uniqueness: true
  validates :name, length: { maximum: 6 }
  validates :email, length: { maximum: 50 }
  validates :encrypted_password, length: { minimum: 6, maximum: 50 }
end
