# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false |
| name               | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_kana         | string | null: false |
| last_kana          | string | null: false |
| birthday           | date | null: false |

### アソシエーション

has_many :products
has_one :address
has_one :order_details 

## products テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| content            | text       |  |
| category_id        | integer    | null: false |
| state_id           | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| delivery_area_id   | integer    | null: false |
| delivery_days_id   | integer    | null: false |
| price              | integer    | null: false |
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
has_one :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false |
| post_code          | string     | null: false |
| delivery_area_id | integer | null: false |
| city               | string     | null: false |
| address_one        | string     | null: false |
| address_two        | string     | |
| phone_number       | string     | null: false |

### アソシエーション
has_one :user
has_one :order
