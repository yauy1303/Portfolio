# WanPal

## URL http://35.75.128.166/

![readme_top2](https://github.com/yauy1303/Portfolio/assets/62428626/2c5a72bf-fa12-4787-8c91-d6adb443bd8a)

## テーマ
ワンコの飼主のための情報共有アプリ

### テーマを選んだ理由
私の家ではワンコを飼っています。
散歩は毎日の日課で散歩を通してお知り合いになった犬友達が沢山います。
その中でお勤めになっていて夜の誰もいない時間にしか散歩にいけないため、
情報交換や雑談ができないという方がいました。

そこで考えたのは、忙しい時間を縫ってワンコの飼主同士がコミュニケーションを取れるといいなと考えました。
上記の理由から、私は「犬についての記事投稿を通してユーザー同士が交流出来るアプリの開発をしました。

### ターゲットユーザー
* 飼い主同士のコミュニティを形成できず悩んでいる人
* ドッグライフを充実させるための情報収集を行いたい人

### 主な利用シーン
* 気になる情報を検索する
* ユーザー同士がコミュニティ機能を通して交流を行う

## 設計書

### ER図
![ER図(WanPal) drawio](https://github.com/yauy1303/Portfolio/assets/62428626/7d427866-7d0b-4d3e-bdb9-e2e43fa98e50)

### テーブル設計書
https://docs.google.com/spreadsheets/d/19tBZm4xjZng5FHS9-odEwjJi17c_b_YR/edit#gid=136342688

### アプリケーション詳細設計書
https://docs.google.com/spreadsheets/d/1LRyVKSuLVDffDGbFq9m5VNiK74IRqk2ZnN-XR5zJkwA/edit#gid=501181805

### ワイヤーフレーム
https://app.diagrams.net/#G1L0hWnogVLp9NkYlAIf6N0ThEQyjdmmAc

### 遷移図
https://app.diagrams.net/?src=about#G1LUo_Jmuet5bJxEzKpC8NtOVXliw_RIGH

## 使用技術
* HTML5 / CSS3
* Sass
* JavaScript (jQuery)
* Ruby 3.1.2
* Ruby on Rails 6.1.7
* Nginx
* Puma
* AWS
  * Cloud9
  * EC2
  * RDS

## 実装機能
* 新規登録・ログイン・ログアウト・退会（Gem devise）
* ゲストログイン
* 管理者権限(コメント削除・会員退会)
* 会員情報編集
* 記事投稿
  * 編集・削除(投稿者権限)
  * タグ投稿
  * マークダウン式テキスト入力(ActiveText)

https://github.com/yauy1303/Portfolio/assets/62428626/ee6cda49-3abe-4e8a-8fc9-44291eec605e

* ランキング
* 新着記事
* いいね(Ajax)
* コメント(Ajax)
* フォロー(Ajax)
  * フォロー/フォロワー一覧

https://github.com/yauy1303/Portfolio/assets/62428626/f311be94-f1e8-4854-85ca-16a04953f1bf

* 検索機能
  * タグリンク
  * タイトル検索(gem ransack)

https://github.com/yauy1303/Portfolio/assets/62428626/7a7bc529-4de6-4717-821f-4a6c92da24cc

* ページネーション(gem kaminari)

## 使用素材
* photoAC
* unsplash 















