# 実行計画を確認できる

## 実行計画

### 実行計画とは、

SQL データベースがクエリを実行する際の「計画」や「手順」です。

データベースはクエリを効率的に実行するために、様々な方法でデータにアクセスし、その中で最も効率的な方法を選択しようとします。

実行計画は、データベースがどのようにテーブルをスキャンし、結合し、フィルタリングし、並べ替えるかを示すものです。

### 実行計画を確認することで、以下のような利点があります。

パフォーマンスの最適化：実行計画を確認することで、クエリが効率的に実行されているかどうかを判断できます。

例えば、不要なフルテーブルスキャンが実行されていないか、適切なインデックスが使用されているかなどをチェックできます。

---

クエリの問題の特定：実行計画を調べることで、クエリが遅い原因や、パフォーマンスに影響を与えている可能性のある要素を特定できます。

これにより、クエリを最適化するための適切な手法を選択することができます。

---

パフォーマンスチューニング：実行計画の情報を使って、データベースの設定やインデックスを調整することで、

クエリのパフォーマンスを向上させることができます。

---

実行計画は、データベース管理者や開発者にとって重要なツールであり、SQL 初心者にも理解しておくべき概念です。

各データベースシステムでは実行計画の表示方法が異なりますが、

一般的には `EXPLAIN` や `EXPLAIN ANALYZE` などのコマンドをクエリの前に付けることで、

実行計画を確認することができます。

---

## 実行計画の確認

次のクエリの実行計画を確認してください。

SELECT \* FROM salaries WHERE salary = 70575;

```
EXPLAIN SELECT * FROM salaries WHERE salary = 70575;
```

```
+----+-------------+----------+------------+------+---------------+------+---------+------+---------+----------+-------------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows    | filtered | Extra       |
+----+-------------+----------+------------+------+---------------+------+---------+------+---------+----------+-------------+
|  1 | SIMPLE      | salaries | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 2607728 |    10.00 | Using where |
+----+-------------+----------+------------+------+---------------+------+---------+------+---------+----------+-------------+
1 row in set, 1 warning (0.03 sec)
```

これで確認できます。

## 実行時間

次のクエリの、最初の行・全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。

なお、EXPLAIN ANALYZE ステートメントを利用することで確認できます。

SELECT \* FROM salaries WHERE salary = 70575

```
EXPLAIN ANALYZE SELECT * FROM salaries WHERE salary = 70575;
```

```
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                                                                                           |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Filter: (salaries.salary = 70575)  (cost=262175 rows=260773) (actual time=9.76..6607 rows=56 loops=1)
    -> Table scan on salaries  (cost=262175 rows=2.61e+6) (actual time=1.26..5724 rows=2.84e+6 loops=1)
 |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (6.62 sec)
```

6.62 秒
実際の実行時間は、データベースシステムやデータの状況、リソースの利用状況などによって異なります。

このステートメントを実際の MySQL データベースで実行して、実行時間を確認してください。

## 高速なクエリ

次のクエリの実行計画及び全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。

SELECT \* FROM salaries WHERE emp_no = 10100;
このクエリは 3 のクエリよりも実行時間が短いはずです。なぜこのクエリの方が高速なのかを説明してください。

```
EXPLAIN ANALYZE SELECT * FROM salaries WHERE emp_no = 10100;
+---------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                   |
+---------------------------------------------------------------------------------------------------------------------------+
| -> Index lookup on salaries using PRIMARY (emp_no=10100)  (cost=1.75 rows=15) (actual time=0.736..0.829 rows=15 loops=1)
 |
+---------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.02 sec)
```

クエリの実行速度は、インデックスの有無や使用方法、検索条件、データベースの設計、データ量などによって大きく異なります。

SELECT _ FROM salaries WHERE emp_no = 10100; というクエリが SELECT _ FROM salaries WHERE salary = 70575;

よりも速い理由は、**通常、emp_no がプライマリーキーやインデックスであることが多いためです。**

プライマリーキーやインデックスがある場合、データベースは検索対象を高速に特定できます。

一方で、salary のようなカラムは、通常インデックスが適用されていないことが多いため、

フルテーブルスキャンが必要になり、より多くの時間がかかることがあります。

結果：プライマリーキーやインデックスを指定するのがいい！
