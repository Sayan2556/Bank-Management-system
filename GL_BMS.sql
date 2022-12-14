# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ((BANK DATABASE SYSTEM)) SQL PROJECT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#            ***************************************************  DDL,DML,DQL,DCL AND TCL COMMANDS  *********************************************************************
#                    ****************************************************  STORE PROCEDURE  ******************************************************************* 




-- ////////////////////////////////////////////////////////// CUSTOMER PERSONAL INFORMATION TABLE ////////////////////////////////////////////////////////////////////////
create table Customer_Info(CUSTOMER_ID VARCHAR(5),
CUSTOMER_NAME varchar(20),
CONTACT_NO bigint(10),
MAIL_ID varchar(20),
GENDER char(1),
MARTIAL_STATUS varchar(10),
IDENTIFICATION_DOC_TYPE varchar(10),
ID_DOC_NUMBER VARCHAR(20),
CITIZENSHIP VARCHAR(30),
constraint CUST_PERC_INFO_PK primary key(CUSTOMER_ID));

SELECT * FROM customer_info;
ALTER TABLE customer_info ADD COLUMN (GUARDIAN_NAME VARCHAR(30),ADDRESS VARCHAR(40));
ALTER TABLE customer_info ADD COLUMN(DOB DATE);
SHOW TABLES;
-- ////////////////////////////////////////////////////////////////// CUSTOMER_REFERENCE TABLE ///////////////////////////////////////////////////////////////////////////
CREATE TABLE CUSTOMER_REFERENCE(CUSTOMER_ID VARCHAR(5),
REFERENCE_ACC_NAME VARCHAR(30),
REFERENCE_ACC_NO BIGINT(16),
REFERENCE_ACC_ADDRESS VARCHAR(100),
RELATION VARCHAR(25),
constraint CUST_REF_INFO_PK primary key(CUSTOMER_ID),
constraint CUST_REF_INFO_PK foreign key(CUSTOMER_ID) references customer_info(CUSTOMER_ID));
SHOW TABLES;
-- /////////////////////////////////////////////////////////////////// BANK INFORMATION TABLE /////////////////////////////////////////////////////////////////////
CREATE TABLE BANK_INFO(IFSC_CODE VARCHAR(15),BANK_NAME VARCHAR(30),BRANCH_NAME VARCHAR(30),constraint BANK_INFO_PK primary key(IFSC_CODE));
SHOW TABLES;
-- ////////////////////////////////////////////////////////////////// ACCOUNT INFORMATION TABLE /////////////////////////////////////////////////////////////////////
CREATE TABLE ACCOUNT_INFO (
ACCOUNT_NO BIGINT(16),
CUSTOMER_ID VARCHAR(5),
ACCOUNT_TYPE VARCHAR(15),
REGISTRATION_DATE DATE,
ACTIVITION_DATE DATE,
IFSC_CODE VARCHAR(15),
INTEREST DECIMAL(7,2),
INITIAL_DEPOSIT BIGINT(10),
constraint ACC_INFO_PK primary key(ACCOUNT_NO),
constraint ACC_INFO_PERS_FK foreign key(CUSTOMER_ID) references customer_info(CUSTOMER_ID),
constraint ACC_INFO_BANK_FK foreign key(IFSC_CODE) references BANK_INFO(IFSC_CODE)
);
SHOW TABLES;

# ###############################################################  VALUE INSERTION INSIDE THE TABLES ############################################################## #
-- ////////////////////////////////////////////////////////////////////// CUSTOMER_INFO TABLE ////////////////////////////////////////////////////////////////////////
INSERT INTO Customer_Info(CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,MAIL_ID,GENDER,MARTIAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NUMBER,CITIZENSHIP,GUARDIAN_NAME,ADDRESS,DOB)
VALUES
("SB001","SURAJ RAJ",7797455690,"suraj12@gmail.com","M","UNMARRIED","ADHAAR","7457801156","INDIAN","RATAN RAJ","SECTOR-5,LAKE TOWN,KOLKATA,WB","1993-05-19"),
("SB002","SUPRATIM SARKAR",7679186477,"sarkar93@gmail.com","M","UNMARRIED","ADHAAR","7432804556","INDIAN","GAUTAM SARKAR","MILANMORE RD,LANE-24,WB","1993-07-17"),
("SB003","ANMOL KR SAH",9797444690,"anmol94@gmail.com","M","MARRIED","ADHAAR","8657891155","INDIAN","PRTHVI KR SAH","DESBANDHUPARA,SILIGURI,WB","1994-10-21"),
("SB004","RAHUL KUMAR",8797467690,"rahul112@gmail.com","M","UNMARRIED","ADHAAR","4567801156","INDIAN","ASHUTOSH KUMAR","SECTOR-5,LAKE TOWN,KOLKATA,WB","1995-10-19"),
("SB005","SANCHITA DAS",8792455690,"sanchita22@gmail.com","F","UNMARRIED","ADHAAR","8757201156","INDIAN","PORITOSH DAS","ALUCHOWDHURI RD,LAKE TOWN,SILIGURI,WB","1995-11-21"),
("SB006","ANIRBAN SARKAR",9832036581,"brook.bat@gmail.com","M","UNMARRIED","ADHAAR","7437501156","INDIAN","RATAN RAJ","BHARAT NAGAR,FULESWARI,SILIGURI,WB","1992-12-21"),
("SB007","KRISHIKA BISWAS",9987765690,"krishika25@gmail.com","F","MARRIED","ADHAAR","8357801156","INDIAN","ROHIT BISWAS","SECTOR-3,KESTOPUR,KOLKATA,WB","1991-11-07"),
("SB008","SAYAN ACHARYA",7003718885,"sacharya12@gmail.com","M","UNMARRIED","ADHAAR","7435791804","INDIAN","TAPAS ACHARYA","SHELCONE GARDENIA,SILIGURI,WB","1993-07-09"),
("SB009","KRISHANU GHOSH",9609711158,"krishanu93@gmail.com","M","UNMARRIED","ADHAAR","8457401156","INDIAN","SANKAR DAS","CHOPRA BAZAAR,ISLAMPUR,WB","1993-09-19"),
("SB010","SUBHADIP BANERJEE",7002155694,"subhadip1@gmail.com","M","UNMARRIED","ADHAAR","7454301526","INDIAN","RATAN BANERJEE","NARMADA BAGAN,CHAMPASHARI,SILIGURI,WB","1993-08-21");
SELECT * FROM Customer_Info;
UPDATE customer_info SET GUARDIAN_NAME="ASHOK SARKAR" WHERE CUSTOMER_ID="SB006";
UPDATE customer_info SET GUARDIAN_NAME="SANKAR GHOSH" WHERE CUSTOMER_ID="SB009";

DESC customer_info;


-- /////////////////////////////////////////////////////////////////////// CUSTOMER_REFERENCE TABLE /////////////////////////////////////////////////////////////////////
INSERT INTO CUSTOMER_REFERENCE(CUSTOMER_ID,
REFERENCE_ACC_NAME,
REFERENCE_ACC_NO,
REFERENCE_ACC_ADDRESS,
RELATION)
VALUES
("SB001","RATAN RAJ",35224687794450012,"SECTOR-5,LAKE TOWN,KOLKATA,WB","FATHER"),
("SB002","GAUTAM SARKAR",35225687494670012,"MILANMORE RD,LANE-24,WB","BROTHER"),
("SB003","PRTHVI KR SAH",36254688863350012,"DESBANDHUPARA,SILIGURI,WB","UNCLE"),
("SB004","ASHUTOSH KUMAR",35454687894458912,"SECTOR-5,LAKE TOWN,KOLKATA,WB","FATHER"),
("SB005","PORITOSH DAS",35221680094450012,"ALUCHOWDHURI RD,LAKE TOWN,SILIGURI,WB","FATHER"),
("SB006","ASHOK SARKAR",35224665794455711,"BHARAT NAGAR,FULESWARI,SILIGURI,WB","FATHER"),
("SB007","RATAN RAJ",35224687794450012,"SECTOR-5,LAKE TOWN,KOLKATA,WB","FATHER"),
("SB008","TAPAS ACHARYA",35223487755450099,"SHELCONE GARDENIA,SILIGURI,WB","FATHER"),
("SB009","SANKAR GHOSH",35224347795550562,"CHOPRA BAZAAR,ISLAMPUR,WB","FATHER"),
("SB010","RATAN BANERJEE",35224337794434012,"NARMADA BAGAN,CHAMPASHARI,SILIGURI,WB","FATHER");

SELECT * FROM CUSTOMER_REFERENCE;

-- ///////////////////////////////////////////////////////////////////// BANK_INFO TABLE ///////////////////////////////////////////////////////////////////////////
INSERT INTO bank_info (IFSC_CODE,BANK_NAME,BRANCH_NAME) VALUES
("001447","STATE BANK OF INDIA","SBI,SALT LAKE"),
("002557","STATE BANK OF INDIA","SBI,CHAMPASHARI"),
("003447","STATE BANK OF INDIA","SBI,SILIGURI"),
("001237","STATE BANK OF INDIA","SBI,LAKE TOWN-KOL"),
("002567","STATE BANK OF INDIA","SBI,DESBANDHUPARA"),
("002367","STATE BANK OF INDIA","SBI,FULESWARI"),
("004877","STATE BANK OF INDIA","SBI,RAJARHAT-KOL"),
("005567","STATE BANK OF INDIA","SBI,DEBIDANGA"),
("009967","STATE BANK OF INDIA","SBI,CHOPRA"),
("001467","STATE BANK OF INDIA","SBI,ANCHAL");
SELECT * FROM bank_info;

-- ////////////////////////////////////////////////////////////////// ACCOUNT INFO TABLE //////////////////////////////////////////////////////////////////////
INSERT INTO ACCOUNT_INFO(
ACCOUNT_NO,CUSTOMER_ID,ACCOUNT_TYPE,REGISTRATION_DATE,ACTIVITION_DATE,IFSC_CODE,INTEREST,INITIAL_DEPOSIT)
 VALUES
 -- (3364558977125787,"SB001","SAVINGS ACC","2021-09-02","2021-09-05","001447",70000.02,70000),
 (3364552977325787,"SB002","SAVINGS ACC","2021-09-02","2021-09-05","001447",90000.10,90010),
 (3364558977127787,"SB003","SALARY ACC","2021-07-01","2021-07-05","001467",21000.02,21000),
 (3364558435125787,"SB004","SAVINGS ACC","2021-11-23","2021-11-26","002367",61245.02,61244),
 (3364555567125787,"SB005","CURRENT ACC","2021-06-02","2021-06-12","002557",70000.02,70000),
 (33645584567125787,"SB006","SAVINGS ACC","2021-03-21","2021-03-28","002567",10000.11,10000),
 (3364558977455787,"SB007","SALARY ACC","2021-02-18","2021-02-20","003447",23654.02,23654),
 (3364552377125787,"SB008","SAVINGS ACC","2021-09-07","2021-09-10","004877",33215.02,33215),
 (3364558973325787,"SB009","SAVINGS ACC","2021-02-02","2021-02-05","005567",66987.02,66987),
 (3364558007123787,"SB010","CURRENT ACC","2021-01-02","2021-01-10","009967",70000.02,70000);
 
 SELECT * FROM account_info;
 
 -- ///////////////////////////////////////////// SHOW ALL TABLES TOGETHER JOIN PROCEDURE ///////////////////////////////////////////////////////////////
 SELECT * FROM customer_info c
 join
 account_info ai
on c.CUSTOMER_ID=ai.CUSTOMER_ID
join
customer_reference cr 
on ai.CUSTOMER_ID = cr.CUSTOMER_ID
join
bank_info b
on b.IFSC_CODE = ai.IFSC_CODE;

-- ////////////////////////////////////////////////////// QWERY SEARCH USING SQL SCRIPTS /////////////////////////////////////////////////////////////// 
# ********************************************* CUSTOMER ID,NAME AND ID DOC FROM CUSTOMER_INFO TABLE *******************************************************

SELECT CUSTOMER_ID,CUSTOMER_NAME,IDENTIFICATION_DOC_TYPE FROM customer_info;

# ********************************** CUSTOMER ID,NAME AND ACCOUNT NO,AMMOUNT FROM CUSTOMER_INFO,ACOOUNT INFO TABLE ******************************************

SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,AI.ACCOUNT_NO,AI.INITIAL_DEPOSIT
FROM
customer_info C
JOIN
account_info AI
ON  C.CUSTOMER_ID = AI.CUSTOMER_ID;

# ***************************************************** CUSTOMER ID,ACCOUNT NO,AMMOUNT > 10000   ************************************************************
SELECT C.CUSTOMER_ID,AI.ACCOUNT_NO,AI.INITIAL_DEPOSIT AS AMMOUNT
FROM
customer_info C
JOIN
account_info AI
ON  C.CUSTOMER_ID = AI.CUSTOMER_ID
WHERE
INITIAL_DEPOSIT >= 10000;

# ***************************************************** IFSC CODE,ACCOUNT NO,BALANCE RS,REFERENCE ACCOUNT NO,ADDRESS   ************************************************************

SELECT AI.IFSC_CODE,CR.REFERENCE_ACC_NO,CR.REFERENCE_ACC_ADDRESS FROM
customer_info CI
JOIN
customer_reference CR
ON CI.CUSTOMER_ID = CR.CUSTOMER_ID
JOIN
account_info AI
ON CI.CUSTOMER_ID = AI.CUSTOMER_ID
ORDER BY CUSTOMER_NAME;

# ***************************************************** IFSC CODE,INTEREST,BALANCE RS,ACCOUNT NO,ACCOUNT TYPE   ************************************************************
SELECT IFSC_CODE,INTEREST,INITIAL_DEPOSIT AS "BALANCE RS",ACCOUNT_NO,ACCOUNT_TYPE
FROM
account_info
ORDER BY IFSC_CODE;

# ***************************************************** IFSC CODE,AMMOUNT,ACCOUNT NO,ACCOUNT TYPE IS SALARY   ************************************************************

SELECT IFSC_CODE,INITIAL_DEPOSIT AS AMMOUNT,ACCOUNT_NO,ACCOUNT_TYPE
FROM
account_info
WHERE ACCOUNT_TYPE = "SALARY ACC" 
ORDER BY IFSC_CODE;

# *************************************************************** SELECTION OF TOP 5 ROWS *********************************************************************
SELECT * FROM account_info
LIMIT 5;

SELECT * FROM bank_info
LIMIT 5;

SELECT * FROM customer_info
LIMIT 5;

SELECT * FROM customer_reference
LIMIT 5;

# ///////////////////////////////////////////////////////////////////// STORE PROCEDURE /////////////////////////////////////////////////////////////////////////////////

# *************************************************************** STORE PROCEDURE FOR ALL CUSTOMER AND BANK DETAILS *********************************************************************
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_details_bank_info`()
BEGIN
SELECT * FROM customer_info c
 join
 account_info ai
on c.CUSTOMER_ID=ai.CUSTOMER_ID
join
customer_reference cr 
on ai.CUSTOMER_ID = cr.CUSTOMER_ID
join
bank_info b
on b.IFSC_CODE = ai.IFSC_CODE;
END 

call customer_details_bank_info;
# *************************************************** STORE PROCEDURE FOR ACCOUNTS DETAILS FOR EACH CUSTOMER*********************************************************

 CREATE DEFINER=`root`@`localhost` PROCEDURE `ACCOUNT_INFO`()
BEGIN
SELECT IFSC_CODE,INTEREST,INITIAL_DEPOSIT AS "BALANCE RS",ACCOUNT_NO,ACCOUNT_TYPE
FROM
account_info
ORDER BY IFSC_CODE;
END 
CALL ACCOUNT_INFO;

# **************************************** STORE PROCEDURE FOR ACCOUINT BALANCE DETAILS USING AMMOUNT VALUES ***********************************************
CREATE DEFINER=`root`@`localhost` PROCEDURE `balance_info`(in INITIAL_DESPOIT BIGINT(10) )
BEGIN
SELECT * FROM account_info WHERE INITIAL_DEPOSIT=INITIAL_DEPOSIT;
END
CALL balance_info(50000);

# ********************************************************** STORE PROCEDURE FOR BANK DETAILS  *************************************************************
CREATE DEFINER=`root`@`localhost` PROCEDURE `bank_details`(BANK_NAME VARCHAR(30))
BEGIN
SELECT * FROM bank_info bi
where
bi.BANK_NAME = BANK_NAME;
END
CALL bank_details("STATE BANK OF INDIA");

# ***************************************************** MODIFY CONSTRAINT *********************************************************************************
SHOW TABLES;
DESC ACCOUNT_INFO;
ALTER TABLE account_info MODIFY ACCOUNT_TYPE varchar(15) NOT NULL;

# ************************************************* RENAMING A COLUMN ***********************************************************************************
SHOW TABLES;
DESC ACCOUNT_INFO;
ALTER TABLE ACCOUNT_INFO CHANGE REGISTRATION_DATE REG_DATE date; 

# ************************************************* COMMIT AND ROLL BACK ***********************************************************************************
SET AUTOCOMMIT = 0;
DESC bank_info;
INSERT INTO bank_info(IFSC_CODE,BANK_NAME,BRANCH_NAME) VALUES ("0146655","HDFC BANK LTD","KERALA BRANCH");
SELECT * FROM bank_info;
/* TIME TO GO TO THE PREVIOUS POSITION OF THE TABLE USING rollback */
ROLLBACK;
SELECT * FROM bank_info;
INSERT INTO bank_info(IFSC_CODE,BANK_NAME,BRANCH_NAME) VALUES ("006684","STATE BANK OF INDIA","KERALA BRANCH");
COMMIT;
SELECT * FROM bank_info; # VALUES INSERTED PERMANENTLY IN THE DATABASE

# ********************************************************* GRANT & REVOKE *******************************************************************************
# *************************************************** GIVING PERMISSION TO USER SAYAN1 TO ACCESS A PARTICULAR TABLE *****************************************************
grant select 
on account_info
to 'SAYAN1';

# *************************************************** GIVING PERMISSION TO USER SAYAN2 TO ACCESS A PARTICULAR TABLE *****************************************************
grant select,update,insert
on customer_info
to 'SAYAN2';

# ************************************************* INSERTING TEMPORARY VALUES USING TRIGGERS,COMMIT AND ROLLBACK  ********************************************************
SET AUTOCOMMIT = 0;
CREATE TRIGGER SAMPLE_TRIGGER
BEFORE INSERT   # YOU CAN WRITE UPDATE USING AFTER ALSO
ON bank_info
FOR EACH ROW    # YOU CAN WRITE COLUMN ALSO 
SET NEW.IFSC_CODE = NEW.IFSC_CODE + 1;
INSERT INTO bank_info(IFSC_CODE,BANK_NAME,BRANCH_NAME) VALUES ("14458","HDFC BANK LTD","SAHAPUR BRANCH");
SELECT * FROM bank_info;
ROLLBACK;








