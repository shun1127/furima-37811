# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true  |
| password           | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_kana         | string | null: false |
| last_kana          | string | null: false |
| birthday           | string | null: false |

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
| Category           | string     | null: false |
| state              | string     | null: false |
| delivery_charge    | string     | null: false |
| delivery_area      | string     | null: false |
| delivery_days      | string     | null: false |
| price              | string     | null: false |
| user               | references | null: false foreign_key: true |

### アソシエーション
has_many :order_details
has_one :users

## order_details テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | foreign_key: true |
| product            | references | foreign_key: true |

### アソシエーション
belongs_to :user
has_many :products
belongs_to :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false foreign_key: true |
| address            | string     | null: false |
| post_code          | string     | null: false |
| name               | string     | null: false |
| province           | string     | null: false |
| city               | string     | null: false |
| address_one        | string     | null: false |
| address_two        | string     | null: false |
| phone_number       | string     | null: false |

### アソシエーション
belongs_to :user
has_one :order
