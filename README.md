# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name_family_kanji|string|null: false|
|name_family_kana|string|null: false|
|name_first_kanji|string|null: false|
|name_first_kana|string|null: false|
|birthday|date|null: false|
|mobile_phone_number|string|null: false, unique: true|
|reset_password_token|string||
|reset_password_sent_at|date||

### Association
has_one  :user_address
has_many :cards
has_many :sns_credentials, dependent: :destroy
has_many :items
has_many :likes
has_many :offers
has_many :points

## user_addresses table
|Column|Type|Options|
|------|----|-------|
|send_name_family_kanji|string|null: false|
|send_name_first_kanji|string|null: false|
|send_name_family_kana|string|null: false|
|send_name_first_kana|string|null: false|
|zip|string|null: false|
|city|string|null: false|
|town|string|null: false|
|apartment|string||
|phone_number|string||
|registered_address|string||
|prefecture|integer|null: false, default: 0|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user

## card table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
belongs_to :user

## sns_credentials table
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user, optional: true

## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|size|string||
|price|integer|null: false|
|status|string|null: false|
|delivery_fee|integer|null: false, default: 0|
|delivery_origin|integer|null: false, default: 0|
|delivery_type|integer|null: false, default: 0|
|schedule|integer|null: false, default: 0|
|process|integer|null: false, default: 0|
|category_id|integer|null: false, forein_key: true|
|brand_id|integer|foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :category
has_many :comments
has_many :offers
has_many_attached :images

## active_storage_blobs table
|Column|Type|Options|
|------|----|-------|
|key|string|null: false, index: true, unique: true|
|filename|string|null: false|
|content_type|string|null: false|
|metadata|text|--|
|byte_size|bigint|null: false|
|checksum|string|null: false|

## active_storage_attachments table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|record_type|string|null: false, index: true, unique: true|
|record_id|references|null: false, polymorphic: true, index: true, unique: true|
|blob_id|references|foreign_key: true|

## comments table
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Associtation
belongs_to: item
belongs_to: user

## likes table
|Column|Type|Options|
|------|----|-------|
|like|string|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :item
belongs_to :user

## transactions table
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|payment_style|string|null: false|
|status|string|null: false|
|payment_date|date||
|request_date|date||
|remittance_date|date||
|delivery_date|date||
|grade|string||
|review|text||
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :item
belongs_to :user

## offers table
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
belongs_to :item
belongs_to :user

## points table
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|kind|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user

## news table
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|tag|string|null: false|