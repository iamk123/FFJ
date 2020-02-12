-- User
INSERT INTO User
VALUES(1, '2017303001', '2017303001','c5f71458b9b8a63a1cf58e42851b1c82','2017303001@qq.com','14792076163',0);
INSERT INTO User
VALUES(2, '2017303002', '2017303002','fcf2005a52c69d08aa502767bd96a2fd','2017303002@qq.com','14792076163',1);
INSERT INTO User
VALUES(3, 'admin', 'admin','21232f297a57a5a743894a0e4a801fc3','2017303007@qq.com','14792076163',2);


-- company
INSERT INTO company
VALUES(1, '软件学院',1,'陕西省西安市长安区西北工业大学长安校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(2, '航天学院',2,'陕西省西安市长安区西北工业大学友谊校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(3, '航海学院',3,'陕西省西安市长安区西北工业大学友谊校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(4, '航空学院',4,'陕西省西安市长安区西北工业大学友谊校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(5, '机电学院',5,'陕西省西安市长安区西北工业大学长安校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(6, '生命学院',6,'陕西省西安市长安区西北工业大学友谊校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(7, '玛丽女王学院',7,'陕西省西安市长安区西北工业大学友谊校区','西北工业大学成立于19xx年xx月，是一个nb的学院');
INSERT INTO company
VALUES(8, '电信学院',8,'陕西省西安市长安区西北工业大学友谊校区','西北工业大学成立于19xx年xx月，是一个nb的学院');

-- Resume
INSERT INTO Resume
VALUES(1,1,"长安校区","2017级");


-- socialwork
INSERT INTO SocialWork
VALUES(1,'活动1','社会活动1介绍','摄影', 1);
INSERT INTO SocialWork
VALUES(2,'活动2','社会活动2介绍','后勤组', 1);
INSERT INTO SocialWork
VALUES(3,'活动1','社会活动2介绍','后勤组', 1);

-- project
INSERT INTO Project
VALUES(4,'项目1','项目描述','项目担任工作',1);
INSERT INTO Project
VALUES(5,'项目2','项目描述','项目担任工作',1);
INSERT INTO Project
VALUES(6,'项目3','项目描述','项目担任工作',1);


-- honor
INSERT INTO Honor
VALUES(1,'获奖1',1);
INSERT INTO Honor
VALUES(2,'获奖2',1);
INSERT INTO Honor
VALUES(3,'获奖3',1);


-- Advantage
INSERT INTO Advantage
VALUES(1,'Python',1);
INSERT INTO Advantage
VALUES(2,'Java',1);
INSERT INTO Advantage
VALUES(3,'C',1);


-- job
INSERT INTO job
VALUES(1,1,2,'数学建模大赛','3','会建模','1k~5k','长安校区','这是Python工程师的工作描述','2019-10-10','14792076163','竞赛');
INSERT INTO job
VALUES(2,2,2,'三航杯程序设计大赛','4','精通Java','1k~5k','友谊校区','这是Java工程师的工作描述','2019-11-11','14792076163','竞赛');
INSERT INTO job
VALUES(3,3,2,'c++算法设计大赛','10','精通c++','1k~5k','长安校区','这是c++工程师的工作描述','2019-12-12','14792076163','竞赛');
INSERT INTO job
VALUES(4,4,2,'Python算法设计大赛','6','精通python','1k~5k','长安校区','这是Python工程师的工作描述','2019-10-10','14792076163','竞赛');
INSERT INTO job
VALUES(5,5,2,'Java算法设计大赛','5','精通Java','1k~5k','友谊校区','这是Java工程师的工作描述','2019-11-11','14792076163','竞赛');
INSERT INTO job
VALUES(6,6,2,'涂鸦大赛','4','精通c++','1k~5k','长安校区','这是c++工程师的工作描述','2019-12-12','14792076163',"竞赛");
INSERT INTO job
VALUES(7,7,2,'网络安全大赛','3','精通Java','1k~5k','友谊校区','这是Java工程师的工作描述','2019-11-11','14792076163','竞赛');
INSERT INTO job
VALUES(8,8,2,'美赛','3','精通c++','1k~5k','长安校区','这是c++工程师的工作描述','2019-12-12','14792076163',"竞赛");
INSERT INTO job
VALUES(9,1,2,'画画','3','精通c++','1k~5k','长安校区','这是c++工程师的工作描述','2019-12-12','14792076163',"招聘");
INSERT INTO job
VALUES(10,2,2,'标注数据','3','精通c++','1k~5k','长安校区','这是c++工程师的工作描述','2019-12-12','14792076163',"招聘");

-- ResumeDeliver
INSERT INTO ResumeDeliver
VALUES(1,'2019-1-1',1,1,0,' ');
INSERT INTO ResumeDeliver
VALUES(2,'2019-2-2',1,1,0,'人满');
INSERT INTO ResumeDeliver
VALUES(3,'2019-1-1',2,1,0,' ');

