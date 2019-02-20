# PostgreSql-Study
PostgreSql-Study

### isntall
```
sudo oat-get install postgresql
psql --version
nmap 127.0.0.1
#port:5432
```
### 初来咋到的postgreSql はじめまして、どうぞ　よろしくお愿い申し上げます
```
sudo su postgres  #install postgres 会创建一个postgres用户 作为postgres管理员
psql -l  #当前数据库一览表
createdb databaseName #系统级命令createDatebase
psql databaseName  #进入database
> help
> \h for help with SQL commands
> \? for help with psql commands
> \l 数据库一栏表
> \q 退出
>select now() 显示当前时间
>select version() 
>dropdb 删除数据库
```
### 数据表操作
- create table
- drop table
```
$ sudo su postgres
$ createdb databaseName
$ psql -l
$ psql databaseName
> create table posts(title varchar(255),content text);
> \dt #当前表一栏
> \d posts  #表详细信息
> alter table posts rename to dollarkiller;
> \dt
> drop table dollarkiller; 
> \dt;
> \q;
$ vim db.sql
create table posts(
    title varchar(255),
    content text
);
$ poql databaseName
> \i db.sql #导入sql
> \dt 
```

### 字段类型
* 数值型:
    + interger(int)
    + real 浮点型
    + serial 序列型
* 文字型:
    + char
    + varchar
    + text
* 布尔型:
    + boolean
* 日期型:
    + data 年月日
    + time 十分秒
    + timestamp 年月日+十分秒
* 特色类型:
    + array
    + 网络地址型(inet)
    + JSON型
    + XML型

### 表约束
```
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT CHECK(LENGTH(content) > 8)   //大于8个长度才运行追加
    is_draft BOOLEAN DEFAULT TRUE,
    is_del BOOLEAN DEFAULT FALSE,
    create_date TIMESTAMP DEFAULT 'now'
);
```
- 约束条件
    - NOT NULL 
    - UNIQUE
    - CHECK: 字段设置条件
    - DEFAULT
    - PRIMARY KEY(NOT NULL,UNIQUE):主键,非空,唯一

### 基础操作
#### INSERT
- 知识点
    - `INSERT INTO [tableName] (field,...) VALUES (VALEUS)`
- 实战
```
$ psql test2
> \dt
> \d test2
```    
#### SQL 部分
> `INSERT INOT test2 (title,content) VALUES ('this is one page','this is centent')`
> `SELECT * FROM test2`
#### select 基本语法
```
create table users (
    id serial primary key,
    player varchar(255) not null,
    score real,
    team varchar(255)
);
```
```
insert into users (player,score,team) values
('库里',28.3,'勇士'),
('哈登',30.2,'火箭');
```
$ `psql test2`
$ `\i init.sql`
> `select * from users;`
> `\x` 将现实数据从x显示改为y现实
> `select player,score from users;`
#### WHERE 语句
- 使用where 实现select update delete
```
select * from user where score > 20 and score <30;
select * from user where player link '阿%';  //link相识 以阿开头的后面的数据
select * from user where player link '阿_';  // 以阿开头的一个字符
```
#### 数据抽出选项
> select 语句在抽出,可以对语句设置更多选项
- order by 排序
- limit 
- offset 从第几条开始取 偏移量
```
select * from users order by score asc;
select * from users order by score desc;
select * from users order by team; #按照球队进行排序
select * from users order by team,score;#按照球队进行排序 默认asc
select * from users order by team,score desc;
select * from users order by score desc limit 3;
select * from users order by score desc limit 3 offset 0;
select * from users order by score desc limit 3 offset 1;
select * from users order by score desc limit 3 offset 2;
```
