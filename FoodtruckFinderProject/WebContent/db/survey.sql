DROP TABLE SURVEY_TB;
DROP TABLE SURVEY_ITEM_TB;
DROP TABLE SURVEY_REPLY_TB;

CREATE TABLE SURVEY_TB 
(
  SURVEY_ID VARCHAR2(100) NOT NULL 
, FOODTRUCK_ID VARCHAR2(100) 
, GENDER VARCHAR2(100) 
, AGE_RANGE VARCHAR2(100)
, OPINION VARCHAR2(300)
, PRIMARY KEY (SURVEY_ID)
);

CREATE TABLE SURVEY_REPLY_TB 
(
  SURVEY_ID VARCHAR2(100) NOT NULL 
, ITEM_ID VARCHAR2(100) NOT NULL
, SCORE NUMBER NOT NULL
, PRIMARY KEY (SURVEY_ID, ITEM_ID)
);

CREATE TABLE SURVEY_ITEM_TB 
(
  ITEM_ID VARCHAR2(100) NOT NULL
, ITEM_NAME VARCHAR2(100) NOT NULL 
, PRIMARY KEY (ITEM_ID, ITEM_NAME)
);


-- 외래키 적용 

ALTER TABLE SURVEY_TB
ADD FOREIGN KEY (FOODTRUCK_ID) REFERENCES FOODTRUCK_TB(FOODTRUCK_ID) ON DELETE CASCADE;

ALTER TABLE SURVEY_REPLY_TB
ADD FOREIGN KEY (ITEM_ID) REFERENCES SURVEY_ITEM_TB(ITEM_ID) ON DELETE CASCADE;

ALTER TABLE SURVEY_REPLY_TB
ADD FOREIGN KEY (SURVEY_ID) REFERENCES SURVEY_TB(SURVEY_ID) ON DELETE CASCADE;


-- 시퀀스 생성 
DROP SEQUENCE SURVEY_SEQ;
CREATE SEQUENCE SURVEY_SEQ START WITH 1 INCREMENT BY 1;

DROP SEQUENCE ITEM_SEQ;
CREATE SEQUENCE ITEM_SEQ START WITH 1 INCREMENT BY 1;

-- DATA INSERT
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F1', 'F', '10', '너무 비싸');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F1', 'M', '20', '가성비 최고 ');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F1', 'M', '30', '맛있음 ');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F1', 'F', '40', '매진된 메뉴가 많아서 아쉬워');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F1', 'F', '20', '맛있어여 ');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F2', 'M', '10', '너무 비싸');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F2', 'M', '20', '맛있음');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F2', 'M', '30', 'good');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F2', 'F', '10', '.');
INSERT INTO SURVEY_TB VALUES ('S'||SURVEY_SEQ.NEXTVAL ,'F2', 'F', '30', 'love it!');

INSERT INTO SURVEY_ITEM_TB VALUES ('I'|| ITEM_SEQ.NEXTVAL,'재료는 신선했나요?');
INSERT INTO SURVEY_ITEM_TB VALUES ('I'|| ITEM_SEQ.NEXTVAL,'음식은 만족스러웠나요?');
INSERT INTO SURVEY_ITEM_TB VALUES ('I'|| ITEM_SEQ.NEXTVAL,'가격은 합리적이었나요?');
INSERT INTO SURVEY_ITEM_TB VALUES ('I'|| ITEM_SEQ.NEXTVAL,'서비스는 만족스러웠나요?');

INSERT INTO SURVEY_REPLY_TB VALUES ('S1', 'I1', 5);
INSERT INTO SURVEY_REPLY_TB VALUES ('S1', 'I2', 4);
INSERT INTO SURVEY_REPLY_TB VALUES ('S1', 'I3', 3);
INSERT INTO SURVEY_REPLY_TB VALUES ('S1', 'I4', 4);
INSERT INTO SURVEY_REPLY_TB VALUES ('S2', 'I1', 4);
INSERT INTO SURVEY_REPLY_TB VALUES ('S2', 'I2', 1);
INSERT INTO SURVEY_REPLY_TB VALUES ('S2', 'I3', 1);
INSERT INTO SURVEY_REPLY_TB VALUES ('S2', 'I4', 4);
INSERT INTO SURVEY_REPLY_TB VALUES ('S3', 'I1', 4);
INSERT INTO SURVEY_REPLY_TB VALUES ('S3', 'I2', 3);
INSERT INTO SURVEY_REPLY_TB VALUES ('S3', 'I3', 3);
INSERT INTO SURVEY_REPLY_TB VALUES ('S3', 'I4', 4);
INSERT INTO SURVEY_REPLY_TB VALUES ('S4', 'I1', 5);
INSERT INTO SURVEY_REPLY_TB VALUES ('S4', 'I2', 5);
INSERT INTO SURVEY_REPLY_TB VALUES ('S4', 'I3', 5);
INSERT INTO SURVEY_REPLY_TB VALUES ('S4', 'I4', 5);

