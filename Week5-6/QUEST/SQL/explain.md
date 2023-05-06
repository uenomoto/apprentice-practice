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

## 実行計画の確認

次のクエリの実行計画を確認してください。

SELECT \* FROM salaries WHERE salary = 70575;

```
EXPLAIN SELECT * FROM salaries WHERE salary = 70575;
```

これで確認できます。

## 実行時間

次のクエリの、最初の行・全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。

なお、EXPLAIN ANALYZE ステートメントを利用することで確認できます。

SELECT \* FROM salaries WHERE salary = 70575;

## 高速なクエリ

次のクエリの実行計画及び全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。

SELECT \* FROM salaries WHERE emp_no = 10100;
このクエリは 3 のクエリよりも実行時間が短いはずです。なぜこのクエリの方が高速なのかを説明してください。