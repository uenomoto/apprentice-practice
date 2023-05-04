# ユーザーを作成・権限付与・削除できる

Root 権限を持つユーザーで MySQL へ接続してください。

## ユーザーの作成

ユーザーを新しく作成します
ホストは localhost を指定!

```:sql
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'your_password';
```

これは、ユーザー名を new_user、パスワードを your_password に設定しています。

---

## ユーザーの表示

```:sql
SELECT User, Host FROM mysql.user;
```

```
+------------------+-----------+
| User             | Host      |
+------------------+-----------+
| root             | %         |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| new_user         | localhost |
| root             | localhost |
+------------------+-----------+
```

確認できます

---

## ユーザーへの権限付与

作成したユーザー(new_user)に、MySQL 内のすべてのデータベースとテーブルへの root のフルアクセス権を付与してください。

なお、ユーザーへの権限付与を学習するために本問題を用意していますが、

**現場ですべてのデータベースへの root のフルアクセス権限を付与することはほぼありません。**

**データベースのセキュリティを危険にさらす可能性があるためです。**

では危険なことをやりたいと思います。

```:sql
GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost';
```

new_user に対してフルアクセス権をあげました

## 権限のリロード

```:sql
FLUSH PRIVILEGES;
```

これで権限の変更を有効にしました！！

---

## ユーザーの削除

new_user 削除

```:sql
DROP USER 'new_user'@'localhost';
```

確認

```:sql
SELECT User, Host FROM mysql.user;
```

これで削除したのが確認できます

```:sql
+------------------+-----------+
| User             | Host      |
+------------------+-----------+
| root             | %         |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
```

---

## ユーザーの再作成

name は my_user でパスワードは my_pass

```:sql
CREATE USER 'my_user'@'localhost' IDENTIFIED BY 'my_pass';
```

```:sql
+------------------+-----------+
| User             | Host      |
+------------------+-----------+
| root             | %         |
| my_user          | localhost |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
```

フルアクセスです。

```:sql
GRANT ALL PRIVILEGES ON *.* TO 'my_user'@'localhost';
```

権限リロード

```:sql
FLUSH PRIVILEGES;
```

**今後は root ユーザーは基本的に使用せず、今回作成したユーザーを使用してください。**
