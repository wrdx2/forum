drop table reply;
CREATE TABLE reply (
  replyId int identity(1,1) NOT NULL,
  topicId int NOT NULL default '0',
  replyContent text NOT NULL,
  userId int NOT NULL default '0',
  replyTime datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (replyId)
)

INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*1,*/2,'���� ��ô�Ҳ��ǳ�������Ա��',1,'2010-05-26 20:14:10');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*2,*/1,'�� �ٺ� �ǵ� ��Ҳ�о��е��� �ٺ� Ӣ��������ͬ�� �ٺ�',4,'2010-05-26 20:14:29');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*4,*/1,'���������ĺϷ��ͺܺ÷��Ϲ淶��',4,'2010-05-26 20:14:59');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*5,*/3,'�ٺ� �˳���ť������Ų�� �ٺ�',4,'2010-05-26 20:20:26');
INSERT INTO reply( topicId,replyContent, userId,replyTime) VALUES (/*7,*/1,'����',1,'2010-06-12 19:24:32');
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
INSERT INTO topic(topicTitle,TopicContent,userId,topicTime,locked,[view]) VALUES (/*1,*/'������ �ٺ� ʮ��̫����','��Ҷ��ð� php�ã�������ô���ٰ�',2,'2010-05-26 20:10:47',1,19);
INSERT INTO topic(topicTitle,TopicContent,userId,topicTime,locked,[view]) VALUES (/*2,*/'����һ�κٺٺٺǺǺð�','���Ǿ��� �ٺ� �����ﻹ �ٺٷ�߷Ż�',4,'2010-05-26 20:12:24',1,7);
INSERT INTO topic(topicTitle,TopicContent,userId,topicTime,locked,[view]) VALUES (/*3,*/'�� �ٺ� ͬ־ ���Ļ��� �պ� �ٺ�','�� �ٺ� ͬ־ ���Ļ��� �պ� �ٺٺǺǺǺ�',4,'2010-05-26 20:15:44',1,14);
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
set identity_insert [user] ON--������������
set identity_insert [user] OFF--�ر�����������

INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (1,'2','admin','123456','1024114660@qq.com',21,0,'1988-11-17',NULL,100);
INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (2,'1','����','aaaaaa','jjjjjjjjjjjjj@126.com',28,0,'2010-05-26 20:08:53','C:Documents and Settingsmr����\\images\n4_02.gif',0);
INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (3,'1','���ٵ�','123456','1024114660@qq.com',0,1,'2010-05-26 20:10:22','',0);
INSERT INTO [user](userId,userType,username,password,email,age,sex,regdate,picture,score) VALUES (4,'0','����','123456','845239568@qq.com',19,0,'2010-05-26 20:10:34','',0);
/*!40000 ALTER TABLE user ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
