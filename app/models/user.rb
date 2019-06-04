class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, dependent: :destroy
  has_many :likes, foreign_key: :likes_count, dependent: :destroy

  validates :name, :email, :encrypted_password, presence: true
  validates :name, :email, uniqueness: true
  validates :name, length: { maximum: 20 }
  validates :email, length: { maximum: 50 }
    validates :encrypted_password, length: { maximum: 50 },length: { minimum: 6}
end
