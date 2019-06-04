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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique:true|
|e_mail|text|null: false , unique:true|
|password|text|null :false|
### Association
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|group_id|reference|foreign_key: true|
### Association
- belongs_to :product, counter_cache: :likes_count
- belongs_to :user


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products