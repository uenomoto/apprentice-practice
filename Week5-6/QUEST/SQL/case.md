## 条件分岐ができる

## CASE

従業員番号 10100 から 10200 の従業員に対して、最終在籍日に応じて在籍中か離職済みかを出し分けたいです。従業員番号、最終在籍日 (to_date)、在職状況(employed/unemployed) を、CASE 式を使用して表示してください。

```
SELECT
    e.emp_no,
    s.to_date,
    CASE
        WHEN s.to_date = '9999-01-01' THEN 'employed'
        ELSE 'unemployed'
    END AS employment_status
FROM
    employees e
    JOIN salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no BETWEEN 10100 AND 10200
LIMIT 50;
```

925 レコードもでできたので 10 件に絞ります
10 件だと退職者しかいなかったので 50 件にしました

```
+--------+------------+-------------------+
| emp_no | to_date    | employment_status |
+--------+------------+-------------------+
|  10100 | 1988-09-20 | unemployed        |
|  10100 | 1989-09-20 | unemployed        |
|  10100 | 1990-09-20 | unemployed        |
|  10100 | 1991-09-20 | unemployed        |
|  10100 | 1992-09-19 | unemployed        |
|  10100 | 1993-09-19 | unemployed        |
|  10100 | 1994-09-19 | unemployed        |
|  10100 | 1995-09-19 | unemployed        |
|  10100 | 1996-09-18 | unemployed        |
|  10100 | 1997-09-18 | unemployed        |
|  10100 | 1998-09-18 | unemployed        |
|  10100 | 1999-09-18 | unemployed        |
|  10100 | 2000-09-17 | unemployed        |
|  10100 | 2001-09-17 | unemployed        |
|  10100 | 9999-01-01 | employed          |
|  10101 | 1999-10-14 | unemployed        |
|  10101 | 2000-09-23 | unemployed        |
|  10102 | 1996-01-02 | unemployed        |
|  10102 | 1997-01-01 | unemployed        |
|  10102 | 1998-01-01 | unemployed        |
|  10102 | 1999-01-01 | unemployed        |
|  10102 | 2000-01-01 | unemployed        |
|  10102 | 2000-12-31 | unemployed        |
|  10102 | 2001-12-31 | unemployed        |
|  10102 | 9999-01-01 | employed          |
|  10103 | 1999-01-12 | unemployed        |
|  10103 | 2000-01-12 | unemployed        |
|  10103 | 2001-01-11 | unemployed        |
|  10103 | 2002-01-11 | unemployed        |
|  10103 | 9999-01-01 | employed          |
|  10104 | 1988-04-15 | unemployed        |
|  10104 | 1989-04-15 | unemployed        |
|  10104 | 1990-04-15 | unemployed        |
|  10104 | 1991-04-15 | unemployed        |
|  10104 | 1992-04-14 | unemployed        |
|  10104 | 1993-04-14 | unemployed        |
|  10104 | 1994-04-14 | unemployed        |
|  10104 | 1995-04-14 | unemployed        |
|  10104 | 1996-04-13 | unemployed        |
|  10104 | 1997-04-13 | unemployed        |
|  10104 | 1998-04-13 | unemployed        |
|  10104 | 1999-04-13 | unemployed        |
|  10104 | 2000-04-12 | unemployed        |
|  10104 | 2001-04-12 | unemployed        |
|  10104 | 2002-04-12 | unemployed        |
|  10104 | 9999-01-01 | employed          |
|  10105 | 2000-05-16 | unemployed        |
|  10105 | 2001-05-16 | unemployed        |
|  10105 | 2001-06-11 | unemployed        |
|  10106 | 1992-10-25 | unemployed        |
+--------+------------+-------------------+
```

CASE 式を使って最終在籍日（to_date）が '9999-01-01' であれば 'employed' を、

そうでなければ 'unemployed' を表示するようにしています。従業員番号（emp_no）、最終在籍日（to_date）、および在職状況

（employment_status）雇用形態を選択することで、条件分岐による出力が可能になります。

テーブルを選択する前に、CASE 式で条件分岐している、e が従業員()で s が給料情報のエイリアスであり、

JOIN によって従業員 ID を紐付けています。

---

## 年代

従業員番号が 10001 から 10050 の従業員を対象に、従業員番号、誕生日、年代を表示してください。なお年代は、誕生日が 1950 年代の場合「50s」、誕生日が 1960 年代の場合「60s」と表記してください。

```
SELECT
    emp_no,
    birth_date,
    CASE
        WHEN EXTRACT(YEAR FROM birth_date) BETWEEN 1950 AND 1959 THEN '50s'
        WHEN EXTRACT(YEAR FROM birth_date) BETWEEN 1960 AND 1969 THEN '60s'
        ELSE 'other'
    END AS yeardate
FROM
    employees
WHERE
    emp_no BETWEEN 10001 AND 10050;
```

```
+--------+------------+----------+
| emp_no | birth_date | yeardate |
+--------+------------+----------+
|  10001 | 1953-09-02 | 50s      |
|  10002 | 1964-06-02 | 60s      |
|  10003 | 1959-12-03 | 50s      |
|  10004 | 1954-05-01 | 50s      |
|  10005 | 1955-01-21 | 50s      |
|  10006 | 1953-04-20 | 50s      |
|  10007 | 1957-05-23 | 50s      |
|  10008 | 1958-02-19 | 50s      |
|  10009 | 1952-04-19 | 50s      |
|  10010 | 1963-06-01 | 60s      |
|  10011 | 1953-11-07 | 50s      |
|  10012 | 1960-10-04 | 60s      |
|  10013 | 1963-06-07 | 60s      |
|  10014 | 1956-02-12 | 50s      |
|  10015 | 1959-08-19 | 50s      |
|  10016 | 1961-05-02 | 60s      |
|  10017 | 1958-07-06 | 50s      |
|  10018 | 1954-06-19 | 50s      |
|  10019 | 1953-01-23 | 50s      |
|  10020 | 1952-12-24 | 50s      |
|  10021 | 1960-02-20 | 60s      |
|  10022 | 1952-07-08 | 50s      |
|  10023 | 1953-09-29 | 50s      |
|  10024 | 1958-09-05 | 50s      |
|  10025 | 1958-10-31 | 50s      |
|  10026 | 1953-04-03 | 50s      |
|  10027 | 1962-07-10 | 60s      |
|  10028 | 1963-11-26 | 60s      |
|  10029 | 1956-12-13 | 50s      |
|  10030 | 1958-07-14 | 50s      |
|  10031 | 1959-01-27 | 50s      |
|  10032 | 1960-08-09 | 60s      |
|  10033 | 1956-11-14 | 50s      |
|  10034 | 1962-12-29 | 60s      |
|  10035 | 1953-02-08 | 50s      |
|  10036 | 1959-08-10 | 50s      |
|  10037 | 1963-07-22 | 60s      |
|  10038 | 1960-07-20 | 60s      |
|  10039 | 1959-10-01 | 50s      |
|  10040 | 1959-09-13 | 50s      |
|  10041 | 1959-08-27 | 50s      |
|  10042 | 1956-02-26 | 50s      |
|  10043 | 1960-09-19 | 60s      |
|  10044 | 1961-09-21 | 60s      |
|  10045 | 1957-08-14 | 50s      |
|  10046 | 1960-07-23 | 60s      |
|  10047 | 1952-06-29 | 50s      |
|  10048 | 1963-07-11 | 60s      |
|  10049 | 1961-04-24 | 60s      |
|  10050 | 1958-05-21 | 50s      |
+--------+------------+----------+
```

このクエリでは、CASE 式と EXTRACT 関数を使って誕生日（birth_date）から年代を計算し、

それに応じて '50s'、'60s'、それ以外は 'other' を表示しています。

従業員番号（emp_no）、誕生日（birth_date）、および年代（yeardate）が出力されます。

---

## 年代ごとの最大給与

年代ごとの最大給与を取得してください。なお年代は、誕生日が 1950 年代の場合「50s」、誕生日が 1960 年代の場合「60s」と表記してください。

```
SELECT
    CASE
        WHEN EXTRACT(YEAR FROM e.birth_date) BETWEEN 1950 AND 1959 THEN '50s'
        WHEN EXTRACT(YEAR FROM e.birth_date) BETWEEN 1960 AND 1969 THEN '60s'
        ELSE 'other'
    END AS yeardate,
    MAX(s.salary) AS max_salary
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY
    yeardate;
```

```
+----------+------------+
| yeardate | max_salary |
+----------+------------+
| 50s      |     158220 |
| 60s      |     156286 |
+----------+------------+
```

このクエリでは、従業員（employees）テーブルと給与（salaries）テーブルを結合し、

CASE 式と EXTRACT 関数を使って誕生日（birth_date）から年代を計算しています。

その後、GROUP BY 句を使って年代ごとにグループ化し、最大給与（max_salary）を取得しています。

従業員（employees）テーブルは、誕生日カラムが必要

給与（salaries）テーブルは、給料カラムが必要

なので結合した

グループ化しないとこのようなエラーがでる ↓

ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'employees.e.birth_date'; this is incompatible with sql_mode=only_full_group_by
