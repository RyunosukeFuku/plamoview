# **DB設計**



## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique:true|
|description|text|null: false|
|like_count|integer|
|category_id|integer|
|user_id|integer|
### Association
- belongs_to :category
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :chats, dependent: :destroy


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique:true|
|e_mail|text|null: false , unique:true|
|password|text|null :false|
### Association
- has_many :products, dependent: :destroy
- has_many :chats, dependent: :destroy
- has_many :likes, dependent: :destroy



## chatsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|reference| foreign_key: true|
|product_id|reference| foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|group_id|reference|foreign_key: true|
### Association
- belongs_to :product, counter_cache: :likes_count
- belongs_to :user