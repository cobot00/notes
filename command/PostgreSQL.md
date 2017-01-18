# PostgreSQL Notw

## login & logout
```bash
psql -U postgres
```

```sql
\q
```

## User

```sql
CREATE ROLE [role_name] WITH SUPERUSER LOGIN PASSWORD 'password'
CREATE ROLE cobot00 WITH SUPERUSER CREATEDB CREATEROLE CREATEUSER LOGIN PASSWORD 'pswd';
CREATE ROLE cobot00 WITH SUPERUSER LOGIN PASSWORD 'pswd';

DROP ROLE [role_name];
DROP ROLE cobot00;

GRANT ALL PRIVILEGES ON develop TO cobot00;
GRANT ALL ON ALL TABLES IN SCHEMA public TO cobot00;

SELECT * FROM pg_user;
```

```sql
\c - [role_name]

SELECT session_user;
```

## Database

```sql
CREATE DATABASE develop;

SELECT * FROM pg_database;
\l

\c [database_name]
```

```sql
\dt
```

## DDL

```sql
CREATE TABLE data_types(
    id INT8 NOT NULL,
    name VARCHAR(32) NOT NULL,
    explanation VARCHAR(128),
    value FLOAT8 NOT NULL DEFAULT 0,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE multi_keys(
    id INT8 DEFAULT 0 NOT NULL,
    id2 INT2 DEFAULT 0 NOT NULL,
    unique_id INT4 DEFAULT 0 NOT NULL,
    name VARCHAR(32) NOT NULL,
    explanation VARCHAR(128),
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, id2)
);

CREATE UNIQUE INDEX multi_keys_idx ON multi_keys (unique_id);
```

```sql
INSERT INTO data_types(id, name, value)
VALUES(1, 'hoge', 1.5);

INSERT INTO data_types(id, name, value)
VALUES(2, 'fuga', 3.8);

INSERT INTO multi_keys(id, id2, unique_id, name)
VALUES(1, 1, 1, 'fuga');
```

## Dictionary

```sql
SELECT *
FROM information_schema.columns
WHERE table_name = 'data_types'

SELECT
table_name, ordinal_position, column_name, data_type,
column_default, is_nullable, character_maximum_length,
numeric_precision, numeric_scale
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'data_types'
ORDER BY table_name, ordinal_position

SELECT
kc.constraint_name, kc.column_name, tc.constraint_type
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE KC
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
ON kc.table_name = tc.table_name AND kc.constraint_name = tc.constraint_name
WHERE kc.table_name = 'data_types'
ORDER BY kc.constraint_name, kc.ordinal_position

SELECT *
FROM pg_indexes
```

## Data type

|type|aliase|explanation|
|---|---|---|
|smallint|int2|2バイト整数|
|integer|int, int4|4バイト整数|
|bigint|int8|8バイト整数||
|numeric|decimal|
|real||6バイト|
|double ||8バイト|
|precision||8バイト|
|serial|||
|varchar||最大n文字の長さの文字列|
|character varying||最大n文字の長さの文字列|
|text||長さに制限の無い文字列|
|timestamp|||
|date|||
||||

## Useful Command
* Version check

```sql
SELECT version();
```
