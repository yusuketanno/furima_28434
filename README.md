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

 テーブル設計

  usersテーブル

|  Column          |   Type     |           Options              |
| --------         | ---------- | ------------------------------ |
| nickname         |   string   |          null: false           |
|  email           |   string   |          null: false           |
| password         |   string   |          null: false           |
| password_confirmation |   string   |     null: false           |
| family_name      |   string   |          null:false            |
| first_name       |   string   |          null:false            |
| family_name_kana |   string   |          null:false            |
| first_name_kana  |   sting    |          null:false            |
| birthday         |   date     |          null:false            |

   Assosiation

- has_many :furima_users
- has_many :items, through: furima_users
- has_one :purchase

  itemsテーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| explanation   | text       | null:false                     |
| category      | integer    | null:false                     |
| item_status   | integer    | null:false                     |
| delivery_fee  | integer    | null:false                     |
| delivery_area | integer    | null:false                     |
| delivery_date | integer    | null:false                     |
| price         | integer    | null:false                     |
| user_id       | integer    | null:false, foreign_key: true  |

   Assosiation

- has_one :purchase
- belongs_to :user

  purchasesテーブル

|   Column    | Type       | Options                        |
|  -------    | ---------- | ------------------------------ |
|  user_id    | integer    | null: false, foreign_key: true |
|  item_id    | integer    | null: false, foreign_key: true |

 Assosiation

- belongs_to :user
- belongs_to :item
- has_one :address

  addressテーブル

|   Column     | Type       | Options                        |
|  ---------   | ---------- | ------------------------------ |
| postal_code  | string     | null:false                     |
| prefectures  | integer    | null:false                     |
| city         | string     | null:false                     |
| address      | string     | null:false                     |
| building     | string     |                                |
| tell         | string     | null:false                     |
| purchase_id  | integer    | null:false, foreign_key: true  |

  Assosiation
- belongs_to :purchase
