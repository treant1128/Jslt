CREATE TABLE foo(
id INT PRIMARY KEY auto_increment,
title VARCHAR (128) NOT NULL, 
taskUrl VARCHAR (256)NOT NULL,
description VARCHAR (256),
createDate datetime,
numPackage VARCHAR (256),
userNum INT,
priority INT,
smsPush BOOLEAN,
skip31 BOOLEAN,
antiDuplicate INT,
verifyStatus BOOLEAN,
processStatus INT,
executeDate datetime
);

CREATE TABLE user(
id INT PRIMARY KEY auto_increment,
name VARCHAR(32) NOT NULL,
pwd VARCHAR(64) NOT NULL,
power CHAR(2),
other VARCHAR (128)
);