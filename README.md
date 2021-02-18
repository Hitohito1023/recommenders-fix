# Recommenders
<img width="1440" alt="スクリーンショット 2021-01-14 15 49 39" src="https://user-images.githubusercontent.com/71477635/104554873-39c5d080-5680-11eb-9f52-e48f85220763.png">

## サイト概要

他人に商品やサービス（映画、本、ゲームの予定）を文章で勧め、購買意欲を掻き立てる投稿サイトです。  
実際のサイトは[こちら](http://recommenders.work/)

### サイトテーマ

他人に利用して欲しい商品やサービスを、あなたの文章で勧めてみましょう。

### テーマを選んだ理由

日々 SNS では商品が投稿され、それらが突如爆発的に流行することがあります。それほど他人に紹介・勧めるという行為は当たり前かつ、重要なものとなっています。そのため商品を勧めるという行為に的を絞ったサイトがあると便利であると考えたから。

### ターゲットユーザ

商品などを勧めたい人、文章能力が高い（高めたい）人
利用したい商品などを探している人

### 主な利用シーン

他人に商品・サービスを勧めたい時、利用したい商品・サービスを探したい時

## 設計書

### 機能一覧
- ログイン機能
- 投稿機能
- Pointを送る機能（非同期通信）
- 検索機能
- ランキング機能
- フォロー機能
- コメント機能（非同期通信）
- 管理者機能

[詳細はこちら](https://docs.google.com/spreadsheets/d/1sZzLGhnEiemAdreQm3jvoI2HdzLPse9RwPZpQTdk3yE/edit#gid=0)

### テーブル定義書
[こちら](https://docs.google.com/spreadsheets/d/1aZxnny2IL_IB0DQs1TfwVMEqY70_l2KUCsCCM9jRcEQ/edit?usp=sharing)

### 活用Gem
- devise(ログイン)
- kaminari(ページネーション)
- Refile(画像投稿)
- Rubocop(リーダブルコード)
- rails_admin(管理者画面)
- RSpec


## 開発環境

- OS：Amazon Linux
- 言語：HTML,CSS,JavaScript,Ruby,MySQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

