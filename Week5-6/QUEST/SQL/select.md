# データを検索できる

## 環境構築

まずはクローン`git clone git@github.com:datacharmer/test_db.git`

クローンしたディレクトリに移動

### もっといい方法があるかもしれませんが私はこの方法で Docker 内のコンテナにホストマシンの DB データをコピーしてできました！

まず最初にカレントディレクトリを`employees.sql`などがあるディレクトリに移動してください！

docker のコンテナ内で使うため、`source load_departments.dump ;`これを`source /tmp/load_departments.dump ;`に変更

employees.sql、変更後 ↓

```:sql:employees.sql
SELECT 'LOADING departments' as 'INFO';
source /tmp/load_departments.dump ;
SELECT 'LOADING employees' as 'INFO';
source /tmp/load_employees.dump ;
SELECT 'LOADING dept_emp' as 'INFO';
source /tmp/load_dept_emp.dump ;
SELECT 'LOADING dept_manager' as 'INFO';
source /tmp/load_dept_manager.dump ;
SELECT 'LOADING titles' as 'INFO';
source /tmp/load_titles.dump ;
SELECT 'LOADING salaries' as 'INFO';
source /tmp/load_salaries1.dump ;
source /tmp/load_salaries2.dump ;
source /tmp/load_salaries3.dump ;

```

これをやらないと docker 内で全て空のテーブルになってしまいます。

今からコンテナ内にコピーします！↓

```
docker cp employees.sql コンテナID:/tmp/employees.sql
docker cp load_dept_emp.dump コンテナID:/tmp/load_dept_emp.dump
docker cp load_dept_manager.dump コンテナID:/tmp/load_dept_manager.dump
docker cp load_employees.dump コンテナID:/tmp/load_employees.dump
docker cp load_salaries1.dump コンテナID:/tmp/load_salaries1.dump
docker cp load_salaries2.dump コンテナID:/tmp/load_salaries2.dump
docker cp load_salaries3.dump コンテナID:/tmp/load_salaries3.dump
docker cp load_titles.dump コンテナID:/tmp/load_titles.dump
```

ざっと docker 内で employees.sql に必要なデータ(テーブル達)をコピーしました。

コンテナ ID は`docker ps`で確認

```
余談(aside)
今回はコンテナ内の tmp にコピーしてます、定期的にデータが削除されるのでご注意！

膨大なデータですし、ずっとはいらないのでここにコピーしました。

本来はずっといるデータなので tmp は避けましょう！
```

`mysql -u root -p < /tmp/employees.sql`で MySQL にインポートします！

`mysql -u root -p`でいつも通り、MySQL にアクセスする。

---

## データベース一覧を表示し、employees データベースがあることを確認する

```
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| employees          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| world              |
+--------------------+
6 rows in set (0.08 sec)
```

## employees データベースを指定する

```
USE employees;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed　←ok
```

## テーブルの一覧を確認する

必ず DB を指定してから！

```
mysql> SHOW TABLES;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.02 sec)
```

以降、employees データベースを使用し操作する！

## 全カラムの取得

部署マネージャーの全データを取得します。dept_manager テーブルの全データを \* を指定して取得します。

```
SELECT * FROM dept_manager;
```

結果

```
mysql> SELECT * FROM dept_manager;
+--------+---------+------------+------------+
| emp_no | dept_no | from_date  | to_date    |
+--------+---------+------------+------------+
| 110022 | d001    | 1985-01-01 | 1991-10-01 |
| 110039 | d001    | 1991-10-01 | 9999-01-01 |
| 110085 | d002    | 1985-01-01 | 1989-12-17 |
| 110114 | d002    | 1989-12-17 | 9999-01-01 |
| 110183 | d003    | 1985-01-01 | 1992-03-21 |
| 110228 | d003    | 1992-03-21 | 9999-01-01 |
| 110303 | d004    | 1985-01-01 | 1988-09-09 |
| 110344 | d004    | 1988-09-09 | 1992-08-02 |
| 110386 | d004    | 1992-08-02 | 1996-08-30 |
| 110420 | d004    | 1996-08-30 | 9999-01-01 |
| 110511 | d005    | 1985-01-01 | 1992-04-25 |
| 110567 | d005    | 1992-04-25 | 9999-01-01 |
| 110725 | d006    | 1985-01-01 | 1989-05-06 |
| 110765 | d006    | 1989-05-06 | 1991-09-12 |
| 110800 | d006    | 1991-09-12 | 1994-06-28 |
| 110854 | d006    | 1994-06-28 | 9999-01-01 |
| 111035 | d007    | 1985-01-01 | 1991-03-07 |
| 111133 | d007    | 1991-03-07 | 9999-01-01 |
| 111400 | d008    | 1985-01-01 | 1991-04-08 |
| 111534 | d008    | 1991-04-08 | 9999-01-01 |
| 111692 | d009    | 1985-01-01 | 1988-10-17 |
| 111784 | d009    | 1988-10-17 | 1992-09-08 |
| 111877 | d009    | 1992-09-08 | 1996-01-03 |
| 111939 | d009    | 1996-01-03 | 9999-01-01 |
+--------+---------+------------+------------+
24 rows in set (0.01 sec)
```

---

## カラムの選択

部署マネージャーの従業員番号の一覧のみを取得してください。dept_manager テーブルの emp_no カラムの値のみを取得します。

カラム全選択の＊から特定のカラム選択に変えただけ

```
SELECT emp_no FROM dept_manager;
```

```
mysql> SELECT emp_no FROM dept_manager;
+--------+
| emp_no |
+--------+
| 110022 |
| 110039 |
| 110085 |
| 110114 |
| 110183 |
| 110228 |
| 110303 |
| 110344 |
| 110386 |
| 110420 |
| 110511 |
| 110567 |
| 110725 |
| 110765 |
| 110800 |
| 110854 |
| 111035 |
| 111133 |
| 111400 |
| 111534 |
| 111692 |
| 111784 |
| 111877 |
| 111939 |
+--------+
24 rows in set (0.01 sec)
```

---

## カラム名の別名

部署マネージャーの従業員番号の一覧のみを、取得データの見出し（カラム）に「employee_no」という名前を付けて取得してください。

AS で名前をつけれます。

あくまで別名です！カラム名変更ではありません

```
SELECT emp_no AS employee_no FROM dept_manager;
```

```
mysql> SELECT emp_no AS employee_no FROM dept_manager;
+-------------+
| employee_no |
+-------------+
|      110022 |
|      110039 |
|      110085 |
|      110114 |
|      110183 |
|      110228 |
|      110303 |
|      110344 |
|      110386 |
|      110420 |
|      110511 |
|      110567 |
|      110725 |
|      110765 |
|      110800 |
|      110854 |
|      111035 |
|      111133 |
|      111400 |
|      111534 |
|      111692 |
|      111784 |
|      111877 |
|      111939 |
+-------------+
24 rows in set (0.01 sec)
```

カラム名が emp_no から employee_no に名付けられました。

**注意！変更したわけではないので検索するたびに AS をつけてわかりやすくしてあげましょう**

---

## 重複行の削除

部署マネージャーが所属する部署番号を重複なく取得してください。

dept_manager テーブルの dept_no カラムの値を、重複を削除して取得します。

`SELECT DISTINCT`を使用することで、重複する行を削除し、**一意** の dept_no カラムの値のみを取得します。

MySQL コマンドラインクライアントで上記のクエリを実行して、部署マネージャーが所属する部署番号を重複なく取得できます。

```
SELECT DISTINCT dept_no FROM dept_manager;
```

```
mysql> SELECT DISTINCT dept_no FROM dept_manager;
+---------+
| dept_no |
+---------+
| d001    |
| d002    |
| d003    |
| d004    |
| d005    |
| d006    |
| d007    |
| d008    |
| d009    |
+---------+
9 rows in set (0.02 sec)

```

このように`d001`や`d002`などの重複が削除されました！
