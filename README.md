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
