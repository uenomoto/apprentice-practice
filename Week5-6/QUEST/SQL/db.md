# データベースを作成・指定・削除できる

## データベースのインストール

docker にてインストールしました。

---

## データベースへの接続

最初の方法でターミナルから接続するやり方で行きます。
`docker compose up -d`コンテナをデタッチドモード（バックグラウンド）で実行します。
`docker exec -it DB bash`でコンテナ内に入りシェルにアクセス。今回は名前を DB にしました。
`mysql -u root -p`で MySQL に接続し自分で設定したパスワードを記述。

- この方法で DB に接続できます！

---

## データベースの作成

MySQL 内に DB を作ります！
まずドッカーなので Docker のコンテナを起動させます！
`docker exec -it DB mysql -u root -p`これで一気にコンテナに入りつつ MySQL にアクセスします
`CREATE DATABASE newdatabase;`これで newdatabase という DB を作成しました！
`SHOW DATABASES;`MySQL サーバーに作成されているすべてのデータベースのリストが表示されます

```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| newdatabase        |
| performance_schema |
| sys                |
| world              |
+--------------------+
```

---

## データベースの表示

`SHOW DATABASES;`MySQL サーバーに作成されているすべてのデータベースのリストが表示されます
上で表示結果貼ってました！

---

## データベースの指定

`USE newdatabase;`で先ほど作った DB を指定できます！
`Database changed`とでます。
これで指定ができました

---

## データベースの削除

`DROP DATABASE データベース名;`で削除できます！
確認は先ほどやった`SHOW DATABASES;`で確認できます！

```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| world              |
+--------------------+
```

---

## データベースの再作成

`CREATE DATABASE newdb;`
今後は newdb と共に学習します！
