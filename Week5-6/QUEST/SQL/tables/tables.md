- **DB のテーブルのカラムチェック！**

SHOW COLUMNS FROM current_dept_emp; 現在の部署従業員

```
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int     | NO   |     | NULL    |       | 従業員番号
| dept_no   | char(4) | NO   |     | NULL    |       | 部署番号
| from_date | date    | YES  |     | NULL    |       | 所属期間の開始日
| to_date   | date    | YES  |     | NULL    |       | 所属期間の終了日
+-----------+---------+------+-----+---------+-------+
```

SHOW COLUMNS FROM departments; 部門

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | char(4)     | NO   | PRI | NULL    |       | 部署番号
| dept_name | varchar(40) | NO   | UNI | NULL    |       | 部署名
+-----------+-------------+------+-----+---------+-------+
```

SHOW COLUMNS FROM dept_emp; 部署従業員

```
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int     | NO   | PRI | NULL    |       |
| dept_no   | char(4) | NO   | PRI | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
```

SHOW COLUMNS FROM dept_emp_latest_date; 部署従業員最新日付

```
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| emp_no    | int  | NO   |     | NULL    |       | 従業員番号
| from_date | date | YES  |     | NULL    |       | 始まりのひ
| to_date   | date | YES  |     | NULL    |       | 終わりのひ
+-----------+------+------+-----+---------+-------+
```

SHOW COLUMNS FROM dept_manager; 部署マネージャー

```
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int     | NO   | PRI | NULL    |       |
| dept_no   | char(4) | NO   | PRI | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
```

SHOW COLUMNS FROM employees; 従業員

```
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int           | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       | 従業員が採用された日付
+------------+---------------+------+-----+---------+-------+
```

SHOW COLUMNS FROM salaries; 給与(年収)

```
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| emp_no    | int  | NO   | PRI | NULL    |       |
| salary    | int  | NO   |     | NULL    |       | 従業員の給与
| from_date | date | NO   | PRI | NULL    |       |
| to_date   | date | NO   |     | NULL    |       |
+-----------+------+------+-----+---------+-------+
```

SHOW COLUMNS FROM titles; 従業員の役職

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_no    | int         | NO   | PRI | NULL    |       |
| title     | varchar(50) | NO   | PRI | NULL    |       |
| from_date | date        | NO   | PRI | NULL    |       |
| to_date   | date        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
```
