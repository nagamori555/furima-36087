# README
# テーブル設計

## users テーブル
| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| full_width_kana    | string   | null: false |
| birth_day          | integer  | null: false |

### Association
- has_many :comments
- has_many :items

## items テーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| item_name          | text       | null: false                     |
| description        | text       | null: false                     |
| category           | integer    | null: false                     |
| status             | integer    | null: false                     |
| delivery_fee       | integer    | null: false                     |
| region             | integer    | null: false                     |
| days_to_ship       | integer    | null: false                     |
| price              | integer    | null: false                     |
| user_id            | references | null: false, foreign_key: true  |

### Association
- has_many :comments
- belongs_to :user
- has_one : address

## comments テーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| comments           | text       | null: false                     |
| user_id            | references | null: false, foreign_key: true  |
| item_id            | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## addresses テーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postal_code        | string     | null: false                     |
| prefecture         | integer    | null: false                     |
| city               | string     | null: false                     |
| house_number       | string     | null: false                     |
| building_name      | string     | null: false                     |
| telephone          | string     | null: false                     |
| item_id            | references | null: false, foreign_key: true  |

### Association
- belongs_to :item