# README
作成中＊随時Update予定

# このアプリについて
 - 筋トレ仲間を探す・記録保持・モチベーション維持
 - 制作期間:Mar 6th,2020 ~
 - 使用Gemや機能、各担当箇所は以下に記載

# Gem/ver
* Ruby:2.5.1

* Rails:5.2.4.1

* System dependencies
 - gem 'mysql2':0.4.4
 - gem 'sass-rails:5.0
 - gem 'jquery-rails'
 - gem 'jbuilder', '~> 2.5'
 - gem 'capistrano'
 - gem 'rspec-rails'
 - gem 'rails-controller-testing'
 - gem 'factory_bot_rails'
 - gem 'pry-rails'
 - gem 'fog-aws'
 - gem 'unicorn':5.4.1
 - gem 'faker':2.8
 - gem 'mini_magick'
 - gem 'font-awesome-sass'
 - gem 'haml-rails'
 - gem 'devise'

# サイトURL（Basic認証キー）


## ER図


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|avatar|text||
|introduction|text||
|mygym|integer||

### Association
- has_many: tweets
- has_many: messages
- has_many: friends
- has_one_attached :avatar
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many :followings, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships


## messagesテーブル(未実装)
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to : user

## Relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|foreign_key: true|
|following_id|integer|null: false|

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"

## Active_storage_blobsテーブル(アバター)
|Column|Type|Options|
|------|----|-------|
|key|string|null: false|
|filename|string|null: false|
|content_type|string||
|metadata|text||
|byte_size|bigint|null: false|
|checksum|string|null: false|

### Association

## Active_storage_attachmentsテーブル(アバター)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|record|references| null: false, polymorphic: true, index: false|
|blob|references|null: false|

### Association
