# 🍳homecooking
### 主婦(主夫)の負担を軽減するアプリケーション

![toppage](https://i.gyazo.com/3fef16408f4411a6528c5d7fca06cb79.jpg)


# 💭　概要

### 昨今、コロナの影響もあり、自宅で食事する機会が増えている。
### 毎日の献立を手助けするアプリケーションです。
料理の悩みは3点ある。

①毎日、献立を考えるのが辛い。

②レシピの分量や、調理法を思い出せない。

③買い物中に家にある食材が思い出せず、重複して購入してしまう。

上記内容を解決できるアプリケーションがあれば、きっと主婦(主夫)の負担は軽減するでしょう。

# 🌐  App URL
### **https://home-cooking-34813.herokuapp.com/** 


# 💻  利用方法

#### `☆ トップページから新規登録・ログイン`
#### `☆ 一覧画面へ遷移する`
#### `☆ レシピ投稿は右上のレシピ投稿をクリック`
#### `☆ 投稿完了後は一覧画面へ戻る`<br>

![Image from Gyazo](https://i.gyazo.com/36f1b81adfeb3861075343cd180b7777.gif)

![Image from Gyazo](https://i.gyazo.com/1c1dac1948e8c0e06fc626f56046a822.gif)

<br>

#### `☆ 一覧画面から１つの投稿を選択 → 投稿詳細画面へ遷移する`
#### `☆ 投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる`
<br>

 [![Image from Gyazo](https://i.gyazo.com/710dcccadc0d83147a03280ffe819e31.gif)](https://gyazo.com/710dcccadc0d83147a03280ffe819e31)

<br>
  
#### `☆ 冷蔵庫ストックは右上の冷蔵庫ストックをクリック`
#### `☆ 冷蔵庫ストックを追加、削除できる`
#### `☆ 冷蔵庫ストックが追加するとスクロール表示できる`
#### `☆ 新規追加すると、文字が赤色になる`<br>
  
  [![Image from Gyazo](https://i.gyazo.com/4ba0585255618aec22a7f34483f9c525.gif)](https://gyazo.com/4ba0585255618aec22a7f34483f9c525)

<br>

#### `☆ カレンダーは右上のカレンダーをクリック`
#### `☆ リクエスト料理を保存し、カレンダーに反映できる`
#### `☆ リクエスト料理をクリックすると、詳細画面が確認できる`
#### `☆ リクエスト料理、隣の[x]をクリックすることで、削除できる`<br>
  
  [![Image from Gyazo](https://i.gyazo.com/ebcd657fe187a7a35961f91458002781.gif)](https://gyazo.com/ebcd657fe187a7a35961f91458002781)
  
  [![Image from Gyazo](https://i.gyazo.com/6214c4d80f878d5d60b856bfca54bf34.gif)](https://gyazo.com/6214c4d80f878d5d60b856bfca54bf34)
 
 [![Image from Gyazo](https://i.gyazo.com/45e5405115f6fe8897a1fd851f1c0b8f.gif)](https://gyazo.com/45e5405115f6fe8897a1fd851f1c0b8f)

# ✅ 課題解決
| ユーザーストーリーから考える課題                                                        | 課題解決                                         |
| ------------------------------------------------------------------------------- | ------------------------------------------------- |
| 毎日、献立を考えないといけない課題                                          | レシピ投稿一覧にてレシピ画像を見ることで献立を考えやすくしている |
| 材料や分量、調理法など忘れてしまうときの課題                                            | レシピ画像をクリックすると調理方法の詳細が閲覧できる |
| 冷蔵庫の中身を忘れていて、スーパーなどで重複購入してしまう課題                                  | 冷蔵庫ストック画面にて、食材ストックが一目でわかるようにしている（食材の追加や削除も容易にできるようにしている） |
| 毎日料理をしていると、直近の献立と重複してしまう課題                                  | カレンダー画面にて、その日のレシピを保存できるため、過去のレシピを振り返ることができる |
| リクエスト料理を家族から聞きたいという課題                                                    | カレンダー画面から、リクエスト料理へ遷移でき、リクエスト料理や、帰宅時間など保存でき、カレンダーに反映される |

# 📝 要件定義
### **https://docs.google.com/spreadsheets/d/11sgUbuGcMQ2BU24t4qYTuXN9FBRokNhashsgIxTWLhc/edit#gid=282075926** 

# 📦  機能一覧
| 機能           | 概要             |
| -------------- | -----------------|
| ユーザー管理機能　| 新規登録・ログイン・ログアウトが可能  |
| 投稿機能 | ログインユーザーのみ、画像付きでレシピ投稿が可能 |
| 投稿閲覧機能 | 投稿画像の閲覧可能な機能 |
| 投稿詳細表示機能 | ログインユーザーのみ、投稿詳細が詳細ページで閲覧可能 |
| 投稿編集・削除機能 | 投稿者本人のみ投稿編集・削除が可能 |
| 冷蔵庫ストック機能 | ログインユーザーのみ、追加・削除・閲覧可能（非同期通信） |
| カレンダー機能 | ログインユーザーのみ、追加・削除・閲覧可能|
| コメント機能 | ログインユーザーのみ、投稿詳細ページからコメントが可能|


## 📝 冷蔵庫ストック機能
| 特徴            | 概要             |
| -------------- | -----------------|
| 非同期通信を活用 | 冷蔵庫ストックは、食材の入れ替わりも多いため、画面表示はシンプルに追加や削除は簡素にするため、非同期通信で実装している |
| 食材を見やすくする | たくさんの食材になっても、列を整え、スクロールできるよう工夫している |

# 📄  テスト用アカウント
| メールアドレス           | パスワード             |
| -------------- | -----------------|
| cooking1@com　| cooking1111  |

# 🔨 追加予定機能
- EC2機能追加予定

#### `☆ ER図`
[![Image from Gyazo](https://i.gyazo.com/5c0233bdb2bf724cee02e6deb1a8ba37.png)](https://gyazo.com/5c0233bdb2bf724cee02e6deb1a8ba37)

# 📎  ローカルでの動作方法

$ git clone https://github.com/toooooku/furima-34813
</br>
$ cd global-day
</br>
$ bundle install
</br>
$ rails db:create
</br>
$ rails db:migrate
</br>
$ rails s
</br>
👉 http://localhost:3000

# 🚜 開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.3.6
- mysql2 0.5.3
- JavaScript
- gem 3.0.3
- heroku 7.52.0

# DB 設計

## users table

| Column                | Type    | Options                 |
| --------------------- | ------- | ----------------------- |
| name                  | string  | null:false              |
| email                 | string  | null:false              |
| password              | string  | null:false              |

### Association

- has_many :recipes
- has_many :comments
- has_many :refrigerators
- has_many :blogs

## recipes table

| Column         | Type          | Options                       |
| -------------- | ------------- | ----------------------------- |
| title          | string        | null:false                    |
| cooking_recipe | text          |                               |
| user           | references    | foreign_key :true             |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| text               | text       | null:false                   |
| recipe             | references | foreign_key :true            |
| user               | references | foreign_key :true            |

### Association

- belongs_to :user
- belongs_to :recipe

## refrigerators table

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| foodstuff      | string     | null:false                   |
| user           | references | foreign_key :true            |

### Association

- belongs_to :user

## blogs table

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| title          | string     | null:false                   |
| content        | text       |                              |
| start_time     | datetime   | null:false                   |
| user           | references | foreign_key :true            |

### Association

- belongs_to :user
