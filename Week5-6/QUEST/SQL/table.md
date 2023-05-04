# テーブルを作成・修正・削除できる

作成済みのデータベース(newdb)を指定して MySQL に接続してください。MySQL に接続後、使用するデータベースを指定しても大丈夫です。
`USE newdb`で db 指定

## テーブルの作成

書籍テーブルを作成テーブルのカラムは主キー、商品名、値段、発売日付を作成

```:sql
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    release_date DATE NOT NULL
);
```

books テーブルが作成！
主キー（id）、商品名（title）、値段（price）、発売日付（release_date）というカラムがあります。
カラムのデータ型は、id が整数型（INT）、title が可変長文字列型（VARCHAR）

price が小数点数値型（DECIMAL）、release_date が日付型（DATE）です。

また、id カラムはオートインクリメントされる主キーとして設定されています。
制約として空欄を許可しない(NOTNULL)です

---

## テーブルの表示

- まずは的確に DB を指定！

```:sql
USE newdb;
```

- テーブルの一覧を表示!

```:sql
SHOW TABLES;
```

```:sql
+-----------------+
| Tables_in_newdb |
+-----------------+
| books           |
+-----------------+
```

books テーブルがあるのが確認できます！

---

## カラムの追加

books テーブルに、author(作者)カラムを一列追加します！

`ALTER TABLE`と`ADD COLUMN`コマンドを使って追加します

```:sql
ALTER TABLE books
ADD COLUMN author VARCHAR(255);
```

---

## カラムの表示

`DESCRIBE`コマンドで指定したテーブルを表示できます

```:sql
DESCRIBE books;
```

---

## カラムの削除

追加したカラムを削除します

`DROP COLUMN`で削除できます。

```:sql
ALTER TABLE books
DROP COLUMN author;
```

テーブルを指定してからカラム削除という流れ

---

## テーブルの削除

作成したテーブルを削除するには、DROP TABLE コマンドを使用します。この例では、books テーブルを削除しています。

```:sql
DROP TABLE books;
```

再度テーブル確認！

```:sql
SHOW TABLES;
```

`Empty set`は DB にひとつもテーブルがないことを示す

## テーブルの再作成

今後、作成したテーブルを指定して作業。

```:sql
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    release_date DATE NOT NULL
);
```

確認！

```:sql
SHOW TABLES;
+-----------------+
| Tables_in_newdb |
+-----------------+
| books           |
+-----------------+
```

ありますね
