# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique  |
| password           | string | null: false |
| name               | string | null: false |

### アソシエーション

has_many :products
has_one :address
has_many :order_details 

## products テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | text       | null: false |
| name               | string     | null: false |
| text               | text       |  |
| price              | string     | null: false |
| user_id            | references | null: false foreign_key: true |

### アソシエーション
has_many :order_details
has_one :users

## order_details テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | references | foreign_key: true |
| order              | references | foreign_key: true |

### アソシエーション
belongs_to :user
has_many :products
belongs_to :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | references | null: false foreign_key: true |
| address            | string     | null: false |
| name               | string     | null: false |

### アソシエーション
belongs_to :user
has_one :order
