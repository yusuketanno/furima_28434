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

# テーブル設計

 ##usersテーブル

|  Column  |   Type     |           Options              |
| -------- | ---------- | ------------------------------ |
| nickname |   string   |          null: false           |
|  email   |   string   |          null: false           |
| password |   string   |          null: false           |
|   name   |   string   |          null:false            |
|   kana   |   sting    |          null:false            |
| birthday |   string   |          null:false            |

###Assosiation

- has_many :furima_users
- has_many :items, through: furima_users
- has_one :purchases

##itemsテーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| image         | references | null: false, foreign_key: true |
| item_name     | string     | null: false, foreign_key: true |
| explanation   | string     | null:false                     |
| category      | references | null:false                     |
| item_status   | references | null:false                     |
| delivery_fee  | references | null:false                     |
| delivery_area | references | null:false                     |
| delivery_date | references | null:false                     |
| price         | string     | null:false                     |

###Assosiation

- has_one :purchases
- belongs_to :users

##purchasesテーブル

|   Column  | Type       | Options                        |
|  -------  | ---------- | ------------------------------ |
| credit_card | string | null: false, foreign_key: true |
|  delivery | string | null: false, foreign_key: true |

###Assosiation

belongs_to :users
belongs_to :items