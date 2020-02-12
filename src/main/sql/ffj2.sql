DROP TABLE SocialWork;
DROP TABLE Project;
DROP TABLE Honor;
DROP TABLE Advantage;
DROP TABLE Resume;
DROP TABLE ResumeDeliver;
DROP TABLE User;
DROP TABLE Job;
DROP TABLE Company;

-- 用户
CREATE TABLE User (
	Id INTEGER NOT NULL AUTO_INCREMENT,	
	name varchar(255) DEFAULT NULL,
	userName varchar(255) UNIQUE DEFAULT NULL,
	password varchar(255) DEFAULT NULL,
	email varchar(255) DEFAULT NULL,
	phone varchar(255) DEFAULT NULL,
	userType tinyint(2) DEFAULT NULL,		
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;

-- 简历
CREATE TABLE Resume (
	id INTEGER NOT NULL AUTO_INCREMENT,
	userId INTEGER NOT NULL COMMENT '对应用户',			
	location varchar(255) DEFAULT NULL COMMENT '地址',			
	grade varchar(255) DEFAULT NULL COMMENT '年级',				
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;

-- 社会工作
CREATE TABLE SocialWork (
	id INTEGER NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,				
	description varchar(1000) DEFAULT NULL,				
	work varchar(255) DEFAULT NULL,						
	resumeId integer NOT NULL,				
	PRIMARY KEY (`id`),
	FOREIGN KEY (resumeId) REFERENCES Resume(id)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;

-- 项目经历
CREATE TABLE Project(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	description varchar(1000) DEFAULT NULL,
	work varchar(1000)DEFAULT NULL,
	resumeId integer NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (resumeId) REFERENCES Resume(id)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;

-- 获奖情况
CREATE TABLE Honor(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name varchar(255) DEFAULT NULL,
	resumeId integer NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (resumeId) REFERENCES Resume(id)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;

-- 个人优势
CREATE TABLE Advantage(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name varchar(255) DEFAULT NULL,
	resumeId integer NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (resumeId) REFERENCES Resume(id)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;



-- 招聘者
CREATE TABLE Company(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name varchar(255) unique NOT NULL,
	userId INTEGER NOT NULL,					
	location varchar(1000) DEFAULT NULL,						
	companyInfo varchar(1000) DEFAULT NULL,					
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;

-- 职位
CREATE TABLE Job(
	id INTEGER NOT NULL AUTO_INCREMENT,
	companyId INTEGER NOT NULL,	
	userId INTEGER DEFAULT NULL,			
	jobName varchar(255) DEFAULT NULL,				
	needNum integer DEFAULT NULL,					
	jobRequire varchar(255) DEFAULT NULL,			
	salary varchar(255) DEFAULT NULL,				
	location varchar(255) DEFAULT NULL,			
	jobInfo varchar(1000) DEFAULT NULL,				
	createTime datetime DEFAULT NULL,				
	contact varchar(255) DEFAULT NULL,				
	kind varchar(255) DEFAULT NULL,				
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 应聘List
CREATE TABLE ResumeDeliver(
	id INTEGER NOT NULL AUTO_INCREMENT,
	createTime datetime DEFAULT NULL,				
	jobId INTEGER DEFAULT NULL,						
	resumeId INTEGER DEFAULT NULL,					
	status tinyint(2) DEFAULT "0" COMMENT '处理状态  0 未处理   1 约请面试     2 抱歉   3 不限  ',				 
	reason varchar(255) DEFAULT NULL COMMENT '原因',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;;
