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
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |

### Association
- has_many :items
- has_many :purchases
- has_one :address


## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| image       | text       | null: false |
| item_name   | string     | null: false |
| explanation | string     | null: false |
| category    | integer    | null: false |
| status      | integer    | null: false |
| shipping    | integer    | null: false |
| area        | integer    | null: false |
| days        | integer    | null: false |
| price       | integer    | null: false |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has-one :purchase

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| house_number  | integer | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_tp :user
- belongs_to :address
