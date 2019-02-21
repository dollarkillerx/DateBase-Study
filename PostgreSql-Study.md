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

#### 统计抽出数据
- distinct 过滤重复的数据
- sum 求和
- max/min 最大最小值
- group by/having 分组  having是针对group by 的where
```
select distinct team from users;
select sum(score) from users;
select max(score) from users;
select min(score) from users;
select * from users where score = (select max(score) from users);
select * from users where score = (select min(score) from users)l
select team,max(score) from users group by team;
select team,max(score) from users group team having max(score) >= 25;
select team.max(score) from users group by team having max(score) >= 25 max(score);
```

#### 方便函数
- length 判断字符长度
- concat  链接两个str
- alias 别名
- substring 切割
- random 随机数
```
select player,length(player) from users;
select player,concat(player,'/',team) from users;
select player,concat(player,'/',team) as "球员信息" from users;
select substring(team,1,1) as "球员首字母" from users;
select concat('我',substring(team,1,1)) as "球员首字母" from users;
select random();
select * from users order by random();
select * from users order by random() limit 1; //随机取
```

#### 更新和删除
- `update [table] set [field=newvalue,....] where ....`
- `dalete from [table] where ...`
```
update users set score = 29.1 where player = '詹姆斯';
update users set score = score + 1 where team = '勇士';
update users set score = score + 100 where team IN ('勇士','骑士');
delete from users where score > 30; 
```

#### 变更表数据
- `alter table [tablename] ...`
- `create index ...`
- `drop index ...`
```
\d users;
alter table users add fullname varchar(255); # 添加字段
\d users;
alter table users drop fullname; # 删除字段
\d users;
alter table users rename player too nba_player;  # 字段重命名
\d users;
alter table user alter nba_player type varchar(100); # 更改nba_player字段类型为varchar(100)
\d users;
create index nba_player_index on users (nba_player); # 加索引  添加名为nba_player_index的索引
\d users;
drop index nba_player_index;  # 删除索引
```

#### 操作多个表
```
create table users (
    id serial primary key,
    player varchar(255) not null,
    score real,
    team varchar(255)
);
insert into users (player,score,team) values
('德马尔-德罗赞',21.4,'圣安东尼奥马刺'),
('克里斯-保罗',15.6,'休斯顿火箭'),
('詹姆斯-哈登',36.6,'休斯顿火箭'),
('斯蒂芬-库里',28.6,'金州勇士'),
('哈里森-巴恩斯',17.4,'金州勇士'),
('凯尔-洛瑞',14.3,'多伦多猛龙');

create table twitters(
    id serial primary key,
    user_id integer,
    content varchar(255) not null
);
insert into twitters (user_id,content) values
(1,'五等分の花嫁中野 二乃'),
(3,'今日も楽しいかった～～💖pizza美味しいかった( ๑ ❛ ڡ ❛ ๑ )🍕'),
(2,'はたらく細胞    血小板'),
(1,'彼女とご飯なう に使っていいよ( ੭´꒳`ᑦ )💖'),
(4,'私の愛、あなたに届け。'),
(5,'二乃とお揃いの色！(｀・ω´・)');
```
```
$ dropdb test2;
$ createdb hello;
$ psql hello;
> \i new.sql
> select * from users;
> select * from twitter;
> select users.player twitters.content from users,twitters where users.id = twitters.user_id;
> select u.plauer.t.contentn from users as u,twitters as t where u.id = t.user_id;
> select u.plauer.t.contentn from users as u,twitters as t where u.id = t.user_id and u.id=1;
```
#### 使用视图
>视图(View)是从一个或多个表导出的对象.视图与表不同,视图的一个虚表,及视图所对应的数据不进行实际存储,
数据库中值存储视图的定义,在对视图的数据进操作时,系统更具视图的定义去操作与视图关联的基本表

>解释:视图就是一个SELECT语句,吧业务系统中常用的SELECT语句简化成类似表的对象,便于简单读取和开发.
- 知识点
    - view
    - create view ...
    - drop view ...
- 演戏
```
> select u.player,t.conntet from users as u,twitters as t where u.id = t.user_id and u.id = 1;
> create view curry_twitters as select u.plauer,t.content from users as u,twitters as t  whereu.id = t.user_id and u.id = 1;
> \dv
> \d curry_twitters
> select * from curry_twitters;
> drop view curry_twitters;
> \db
```    

#### 事物
> 保证数据的完整性 一致性 原子性 隔离型 持久性
- begin
- commit 
- rollback
```
select * from users;
begin; #开启事物
update users set score = 50 where player = '库里';
update users set score = 60 where player = '哈登';
commit;
rollback; # 回滚
```

