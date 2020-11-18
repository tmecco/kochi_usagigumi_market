# README

# ChatSpace DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|index: true|
|password|string|null: false|
### Association
- has_many :items
- has_many :comments, dependent: :destroy
- has_many :destinations, dependent: :destroy
- has_many :cards, dependent: :destroy 
- has_one :user_profiles, dependent: :destroy

## user_profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false| 
|family_name|string|null: false|
|kana_first_name|string|null: false|
|kana_family_name|string|null: false|
|birthday|date|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false| 
|destination_family_name|string|null: false|
|destination_kana_first_name|string|null: false|
|destination_kana_family_name|string|null: false|
|post_code|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|unique :true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
-  belongs_to_active_hash :prefecture

## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_token|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|created|timestamp|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|prefecture_code|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|item_condition_id|integer|null: false|
|postage_payer_id|integer|null: false|
|preparation_day|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :comments, dependent :destroy
- has_many :item_images, dependent :destroy 
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- Gem :jp_prefecture

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|ancestry|string|null: false|
|name|string|null: false|
### Association
- has_many :items
- has_ancestry
