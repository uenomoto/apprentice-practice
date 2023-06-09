# 検索結果の並び替えができる

## 昇順の並び替え

従業員を誕生日の昇順に並び替え、年齢が高い人トップ 10 のレコードを取得してください。

```
SELECT *
FROM employees
ORDER BY birth_date ASC
LIMIT 10;
```

```
+--------+------------+------------+--------------+--------+------------+
| emp_no | birth_date | first_name | last_name    | gender | hire_date  |
+--------+------------+------------+--------------+--------+------------+
| 207658 | 1952-02-01 | Kiyokazu   | Whitcomb     | M      | 1988-07-26 |
|  87461 | 1952-02-01 | Moni       | Decaestecker | M      | 1986-10-06 |
|  65308 | 1952-02-01 | Jouni      | Pocchiola    | M      | 1985-03-10 |
| 406121 | 1952-02-01 | Supot      | Remmele      | M      | 1989-01-27 |
|  91374 | 1952-02-01 | Eishiro    | Kuzuoka      | M      | 1992-02-12 |
| 237571 | 1952-02-01 | Ronghao    | Schaad       | M      | 1988-07-10 |
|  33131 | 1952-02-02 | Reinhold   | Savasere     | M      | 1998-01-30 |
|  51486 | 1952-02-02 | Jianwen    | Sigstam      | F      | 1989-07-20 |
|  61382 | 1952-02-02 | Kristof    | Ranft        | M      | 1989-04-21 |
|  59884 | 1952-02-02 | Fan        | Przulj       | M      | 1991-09-25 |
+--------+------------+------------+--------------+--------+------------+
```

このクエリは、employees テーブルから全てのカラムを取得し、

ORDER BY 句を使用して birth_date カラムの昇順（ASC）で並び替えた結果から、

年齢が高い人（つまり、誕生日が古い人）トップ 10 のレコードを取得しています。

---

## 降順の並び替え

従業員を誕生日の降順に並び替え、年齢が若い人トップ 10 のレコードを取得してください。

```
SELECT *
FROM employees
ORDER BY birth_date DESC
LIMIT 10;
```

```
+--------+------------+------------+-----------------+--------+------------+
| emp_no | birth_date | first_name | last_name       | gender | hire_date  |
+--------+------------+------------+-----------------+--------+------------+
|  60091 | 1965-02-01 | Surveyors  | Bade            | F      | 1988-05-01 |
|  66702 | 1965-02-01 | Deniz      | Thibadeau       | F      | 1986-03-11 |
|  33293 | 1965-02-01 | Adamantios | Vanwelkenhuysen | M      | 1987-12-12 |
|  59869 | 1965-02-01 | Zsolt      | Riefers         | M      | 1987-09-25 |
|  74344 | 1965-02-01 | Hiroyasu   | Provine         | M      | 1994-11-25 |
|  80850 | 1965-02-01 | Koldo      | Luit            | M      | 1993-11-19 |
|  86422 | 1965-02-01 | Jaewon     | Thummel         | F      | 1985-09-14 |
|  37592 | 1965-02-01 | Berni      | Stranks         | M      | 1985-11-05 |
|  93278 | 1965-02-01 | Magdalena  | Penn            | F      | 1987-04-27 |
|  11157 | 1965-02-01 | Mario      | Cochrane        | M      | 1985-03-30 |
+--------+------------+------------+-----------------+--------+------------+
```

このクエリは、employees テーブルから全てのカラムを取得し、

ORDER BY 句を使用して birth_date カラムの降順（DESC）で並び替えた結果から、

年齢が若い人（つまり、誕生日が新しい人）トップ 10 のレコードを取得しています。

---

## 複数条件の並び替え

従業員を、年齢が高い順に並び替え、誕生日が同じなら雇った日付が最近の順で並び替え、

トップ 30 のレコードを取得してください。

```
SELECT *
FROM employees
ORDER BY birth_date ASC, hire_date DESC
LIMIT 30;
```

```
+--------+------------+------------+--------------+--------+------------+
| emp_no | birth_date | first_name | last_name    | gender | hire_date  |
+--------+------------+------------+--------------+--------+------------+
|  91374 | 1952-02-01 | Eishiro    | Kuzuoka      | M      | 1992-02-12 |
| 406121 | 1952-02-01 | Supot      | Remmele      | M      | 1989-01-27 |
| 207658 | 1952-02-01 | Kiyokazu   | Whitcomb     | M      | 1988-07-26 |
| 237571 | 1952-02-01 | Ronghao    | Schaad       | M      | 1988-07-10 |
|  87461 | 1952-02-01 | Moni       | Decaestecker | M      | 1986-10-06 |
|  65308 | 1952-02-01 | Jouni      | Pocchiola    | M      | 1985-03-10 |
|  48910 | 1952-02-02 | Zhongwei   | DuBourdieux  | M      | 1999-12-19 |
|  33131 | 1952-02-02 | Reinhold   | Savasere     | M      | 1998-01-30 |
| 462774 | 1952-02-02 | Moie       | Chinal       | F      | 1997-09-20 |
| 436596 | 1952-02-02 | Gou        | Pearson      | F      | 1997-08-14 |
|  12282 | 1952-02-02 | Tadahiro   | Delgrange    | M      | 1997-01-09 |
| 217446 | 1952-02-02 | Mayuri     | Barriga      | F      | 1996-06-26 |
| 462007 | 1952-02-02 | Rasiah     | Smeets       | M      | 1995-03-09 |
| 405962 | 1952-02-02 | Moto       | Staudhammer  | M      | 1995-02-20 |
| 203054 | 1952-02-02 | Hausi      | Krohn        | M      | 1994-11-23 |
|  73959 | 1952-02-02 | True       | Denny        | M      | 1994-05-25 |
| 455745 | 1952-02-02 | Moni       | Giveon       | F      | 1994-01-17 |
| 256423 | 1952-02-02 | Bodh       | Baik         | M      | 1993-12-27 |
| 494291 | 1952-02-02 | Cedric     | Tsukuda      | F      | 1993-12-12 |
| 244265 | 1952-02-02 | Pantung    | Halevi       | M      | 1993-11-12 |
| 222160 | 1952-02-02 | Mana       | Salinas      | M      | 1993-05-05 |
|  79034 | 1952-02-02 | Janalee    | Perri        | F      | 1992-12-10 |
| 449186 | 1952-02-02 | Sachar     | Loncour      | M      | 1992-12-04 |
|  29456 | 1952-02-02 | Barun      | Krohm        | F      | 1992-11-23 |
| 467994 | 1952-02-02 | Shridhar   | Horswill     | M      | 1992-10-17 |
| 429276 | 1952-02-02 | Juyoung    | Seghrouchni  | M      | 1992-08-17 |
| 103295 | 1952-02-02 | Shigehito  | Sommer       | F      | 1992-03-15 |
| 234728 | 1952-02-02 | Kolar      | Chepyzhov    | M      | 1992-01-24 |
| 423460 | 1952-02-02 | Wuxu       | Miara        | M      | 1991-10-10 |
|  59884 | 1952-02-02 | Fan        | Przulj       | M      | 1991-09-25 |
+--------+------------+------------+--------------+--------+------------+
```

このクエリは、employees テーブルから全てのカラムを取得し、ORDER BY 句を使用して複数の条件で並び替えた結果から、

トップ 30 のレコードを取得しています。まず、birth_date カラムの昇順（ASC）で年齢が高い順に並び替え、

次に hire_date カラムの降順（DESC）で雇った日付が最近の順に並び替えます。
