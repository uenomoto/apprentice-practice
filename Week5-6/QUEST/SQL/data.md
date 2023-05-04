# データを登録・検索・更新・削除できる

## データの登録

books テーブルに対して、任意のデータを一行(レコード)追加します！

INSERT INTO コマンドでクリエイトできます。

```:sql
INSERT INTO books (title, price, release_date)
VALUES ('Sample Book', 19.99, '2023-05-01');
```

このコマンドで、books テーブルに、商品名（title）が「Sample Book」、

値段（price）が 19.99 円、発売日付（release_date）が'2023-05-01'のデータが追加されます。

---

## データの検索

データを追加した books テーブルに対して、すべてのデータを検索して出力します！

books テーブルからすべてのデータを検索して出力するには\*で SELECT コマンドを使用します。

```:sql
SELECT * FROM books;
```

```:sql
SELECT * FROM books;
+----+-------------+-------+--------------+
| id | title       | price | release_date |
+----+-------------+-------+--------------+
|  1 | Sample Book | 19.99 | 2023-05-01   |
+----+-------------+-------+--------------+
```

---

## データの更新

値上げします。

```:sql
UPDATE books
SET price = 29.99
WHERE title = 'Sample Book';
```

books テーブルのデータを更新するには、`UPDATE` コマンドを使用します。

この例では、商品名（title）が「Sample Book」のデータの値段（price）を 29.99 に更新しています。

更新対象のデータや値を変更する場合は、適切に条件を指定してください。

```:sql
SELECT * FROM books;
+----+-------------+-------+--------------+
| id | title       | price | release_date |
+----+-------------+-------+--------------+
|  1 | Sample Book | 29.99 | 2023-05-01   |
+----+-------------+-------+--------------+
```

確認しました！

---

## データの削除

books テーブル内のすべてのデータを削除するには、`DELETE`コマンドを使用します。

以下の SQL コマンドを実行して、テーブル内の全データを削除できます。

```:sql
DELETE FROM books;
```

このコマンドで、books テーブル内のすべてのデータが削除されます。

あくまで、テーブルの中のデータの為テーブル本体は削除されず、構造はそのまま残ります。

```
SELECT * FROM books;
Empty set
```

データは無くなりました！

```:sql
SELECT * FROM books;
Empty set (0.00 sec)

mysql> SHOW TABLES;
+-----------------+
| Tables_in_newdb |
+-----------------+
| books           |
+-----------------+
1 row in set (0.03 sec)

mysql> DESCRIBE books;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| id           | int           | NO   | PRI | NULL    | auto_increment |
| title        | varchar(255)  | NO   |     | NULL    |                |
| price        | decimal(10,2) | NO   |     | NULL    |                |
| release_date | date          | NO   |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
4 rows in set (0.02 sec)
```

このようにテーブルはのこってます！
