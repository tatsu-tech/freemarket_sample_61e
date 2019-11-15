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
|mail|string|null: false, unique: true|
|password|string|null: false|
|name_full|string|null: false|
|name_reading|string|null: false|
|birthday|date|null: false|
|mobile_phone_number|string|null: false, unique: true|
|image|string||
|profile|text||
|bank|string||
|branch|string||
|account_type|string||
|account_number|string||
|account_name|string||

### Association
has_many :items
has_many :comments
has_many :likes
has_many :offers
has_many :points

## user_addresses table
|Column|Type|Options|
|------|----|-------|
|address|string|null: false|
|phone_number|string||
|registered_address|string||
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user

## credit_card table
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|expiring_month|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :items
has_ancestry

## brands table 
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :items
has_many :brand_groups, through: :brands_groups
has_many :brans_groups

## brands_groups table
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, foreign_key: true|
|brand_group_id|integer|null: false, foreign_key: true|

### Association
belongs_to :brand
belongs_to :brand_group

## brand_groups table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :brands, through: :brands_groups
has_many :brands_groups

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