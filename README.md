# README
<h1 align="center">BulkFriends</h1>
<br>
<p align="center">
<a><a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" /></a>
<a><a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/39142850/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /></a><br>
<a><a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="60px;" /></a>
<a><a href="https://sass-lang.com/"><img src="https://user-images.githubusercontent.com/39142850/71774644-115bbe80-2fb6-11ea-822c-568eabde5228.png" height="60px" /></a>
<a><a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/39142850/71774768-d064a980-2fb7-11ea-88ad-4562c59470ae.png" height="65px;" /></a>
<a><a href="https://aws.amazon.com/"><img src="https://user-images.githubusercontent.com/39142850/71774786-37825e00-2fb8-11ea-8b90-bd652a58f1ad.png" height="60px;" /></a>
</p><br>

# このアプリについて
 - 筋トレ仲間を探す・記録保持・モチベーション維持
 - 制作期間:Mar 6th,2020 ~ Apr.19th,2020
 - 使用Gemや機能、各担当箇所は以下に記載

# 主な機能
 - Training:日ごとにトレーニング内容を記録でき、カレンダーで簡単に管理。
 - Friends:検索フォームに何も入れずに検索ボタンを押すと、登録者が一覧で表示されます。
           他のユーザーのページにある、ハートマークを押すと友達申請となり、
           お互いにハートマークが押されると友達となり、メッセージ機能が解放。
 - Messages:友達となったユーザーとメッセージの交換ができます。(画像含む)
            Ajaxによる自動更新を搭載しているため、ストレスないやり取りが可能。
 - Mygym:自身の通っているジムを登録すると、同ジムを登録しているユーザーのつぶやきが表示される。

# Gem/ver
* Ruby:2.5.1
* Rails:5.2.4.1

*** System dependencies ***
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
 - gem 'simple_calendar'

# サイトURL
http://18.176.245.132/

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
- has_many: friends
- has_one_attached :avatar
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many :followings, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships
- has_many :messages
- has_many :sent_messages, through: :messages, source: :receive_user
- has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receive_user_id'
- has_many :received_messages, through: :reverses_of_message, source: :user
- has_many :trainings
- has_one :mygym
- has_many: tweets


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user|references|foreign_key: true|
|image|string||
|receive_user|references|foreign_key: {to_table: :users}|

### Association
- belongs_to : user
- belongs_to :receive_user

## Relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|foreign_key: true|
|following_id|integer|null: false|

### Association
- belongs_to :follower, class_name: "User"
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

## Active_storage_attachmentsテーブル(アバター)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|record|references| null: false, polymorphic: true, index: false|
|blob|references|null: false|


## tainingsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text||
|start_time|date|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to : user

## mygymsテーブル
|Column|Type|Options|
|------|----|-------|
|gym|integer|null: false, default: 0|
|user|references|foreign_key: true|

### Association
- belongs_to : user

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to : user