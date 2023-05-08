# ER 図を書くことができる

## ER 図

EC サイトの第三正規形の設計を、ER 図にしましょう。

各テーブルがどのようなデータを持っており、テーブル間がどのような関連をしているかを ER 図で表現してください。

なお、テーブル名とカラム名は日本語で大丈夫です。

ツールの PlantUML を使用しました。

コード:スタイルは black-knight を使用個人的みやすいです

```
@startuml
!theme black-knight
' hide the spot
hide circle

' avoid problems with angled crows feet
skinparam linetype ortho

entity "ユーザーテーブル(user)" as user {
  *ID : bigint(20) <<generated>>
  --
  名前 : varchar(100)
}

entity "注文テーブル(order)" as order {
  *ID : bigint(20) <<generated>>
  --
  *user_id : bigint(20) <<FK>>
  注文日付 : datetime
}

entity "注文商品テーブル(ordered_goods)" as order_item {
  *ID : bigint(20) <<generated>>
  --
  *item_id : bigint(20) <<FK>>
  *order_di : bigint(20) <<FK>>
  商品個数 : int(11)
}

entity "商品テーブル(item)" as item {
  *ID : bigint(20) <<generated>>
  --
  category_id : bigint(20) <<FK>>
  商品名 : varchar(255)
  値段 : int(11)
}

entity "カテゴリーテーブル(category)" as category {
  *ID : bigint(20) <<generated>>
  --
  カテゴリー名: varchar(255)
}

user ||--o{ order
order ||--o{ order_item
item ||--o{ order_item
item }o--|| category
@enduml
```

![ER](/images/er_test.png "ER")
