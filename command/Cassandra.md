# Cassandra Note

## Install
http://cassandra.apache.org/download/

`2.2.6`

## start
```
bin/cassandra.bat
```

## Data type

|type|explanation|
|---|---|
|int|整数(4バイト)|
|bigint|整数(8バイト)|
|double|倍精度浮動小数点|
|text|文字列|
|timestamp|UNIXタイム(整数)|
|boolean|真偽値|
|blob|バイト|
|uuid|UUID|

## DDL

```sql
CREATE KEYSPACE develop
WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE develop.emp (
  empId int,
  deptId int,
  firstName varchar,
  lastName varchar,
  PRIMARY KEY (empId, deptId)
);

CREATE INDEX emp_first_name ON develop.emp (firstName);
```


