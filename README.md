# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_day          | date    | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_name   | string     | null: false |
| explanation | string     | null: false |
| category_id | integer    | null: false |
| status_id   | integer    | null: false |
| shipping_id | integer    | null: false |
| area_id     | integer    | null: false |
| days_id     | integer    | null: false |
| price       | integer    | null: false |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| house_number  | integer | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address
