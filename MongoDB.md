MongoDB
===
### install
```
sudo apt-get update
sudo apt-get install -gy mongodb-org
sudo service mogod start
sudo service mongod restart
sudo service mongod stop
```
- run 
```
cd /bil/systemd/system
cat mongod.service
sudo systemctl start mongid.service
sudo systemctl stop mongid.service
sudo systemctl enable mongid.service #确认服务启动
sudo systemctl is-enabled mongid.service # 查询当前状态
```
### 基本概念的理解
- 数据库 Datebase
- 集合 Collection  相当于关系型数据库 数据表 Table
- 文档 Document    相当于关系型数据库 记录 Recird

#### 数据库使用步骤
1. 建立数据库 (DollarKiller)
2. 建立数据集合 (Posts,Categories,Tags)
3. 建立数据 (Post:{"_id":"","title":""})

* DollarKILLER
    * Posts
        - {"_id":"1","title":"This is my first blog"}
        - {"_id":"2","title":"This is my second blog."}
        - {"_id":"3","title":"This is my third blog.","delflg":1}
    * Categiries
        - {"_id":"1","title":"游戏"}
        - {"_id":"2","title":"技术"}
    * Tags
        - {"_id":"1","title":"golang"}
        - {"_id":"1","title":"python"}
        - {"_id":"1","title":"php"}
#### NoSql
在NoSQL的数据库中,操作数据库是通过指令或程序语言完成,在MongoDB中是通过ES和JSON数据结构来操作和管理数据

### 简简单单NoSql

