drop table reply;
CREATE TABLE reply (
  replyId int identity(1,1) NOT NULL,
  topicId int NOT NULL default '0',
  replyContent text NOT NULL,
  userId int NOT NULL default '0',
  replyTime datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (replyId)
)

INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*1,*/2,'回帖 怎么我不是超级管理员那',1,'2010-05-26 20:14:10');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*2,*/1,'恩 嘿嘿 是的 我也感觉有点少 嘿嘿 英雄所见略同啊 嘿嘿',4,'2010-05-26 20:14:29');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*4,*/1,'哈哈哈方的合法和很好符合规范化',4,'2010-05-26 20:14:59');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*5,*/3,'嘿嘿 退出按钮往后面挪呗 嘿嘿',4,'2010-05-26 20:20:26');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*7,*/1,'贷款',1,'2010-06-12 19:24:32');
/*!40000 ALTER TABLE reply ENABLE KEYS */;

drop table topic;
CREATE TABLE topic (
  topicId int identity(1,1) NOT NULL,
  topicTitle varchar(100) NOT NULL default '',
  TopicContent text NOT NULL,
  userId int NOT NULL default '0',
  topicTime datetime NOT NULL default '0000-00-00 00:00:00',
  locked bit NOT NULL default '1',
  [view] int NOT NULL default '0',
  PRIMARY KEY  (topicId)
)
INSERT INTO topic(topicTitle,TopicContent,userId,topicTime,locked,[view]) VALUES (/*1,*/'来看看 嘿嘿 十个太多了','大家都好啊 php好，字数怎么还少啊',2,'2010-05-26 20:10:47',1,19);
INSERT INTO topic(topicTitle,TopicContent,userId,topicTime,locked,[view]) VALUES (/*2,*/'来此一游嘿嘿嘿呵呵好吧','就是就是 嘿嘿 不错嘛还 嘿嘿风高放火',4,'2010-05-26 20:12:24',1,7);
INSERT INTO topic(topicTitle,TopicContent,userId,topicTime,locked,[view]) VALUES (/*3,*/'恩 嘿嘿 同志 做的还行 凑合 嘿嘿','恩 嘿嘿 同志 做的还行 凑合 嘿嘿呵呵呵呵',4,'2010-05-26 20:15:44',1,14);
/*!40000 ALTER TABLE topic ENABLE KEYS */;

drop table [user];
CREATE TABLE [user] (
  userId int NOT NULL identity(1,1),
  userType char NOT NULL default '0',
  username varchar(60) NOT NULL default '',
  password varchar(40) NOT NULL default '',
  email varchar(100) default NULL,
  age int NOT NULL default '0',
  sex tinyint NOT NULL default '0',
  regdate datetime NOT NULL default '0000-00-00 00:00:00',
  picture varchar(50) default NULL,
  score int NOT NULL default '0',
  PRIMARY KEY  (userId)
)
set identity_insert [user] ON--打开自增的限制
set identity_insert [user] OFF--关闭自增的限制

INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (1,'2','admin','123456','1024114660@qq.com',21,0,'1988-11-17',NULL,100);
INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (2,'1','李四','aaaaaa','jjjjjjjjjjjjj@126.com',28,0,'2010-05-26 20:08:53','C:Documents and Settingsmr桌面\\images\n4_02.gif',0);
INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (3,'1','王荣道','123456','1024114660@qq.com',0,1,'2010-05-26 20:10:22','',0);
INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (4,'0','张三','123456','845239568@qq.com',19,0,'2010-05-26 20:10:34','',0);
/*!40000 ALTER TABLE user ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
