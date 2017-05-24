--DROP TABLE REVIEW_TB;
--DROP SEQUENCE REVIEW_SEQ;

CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT by 1;
CREATE TABLE REVIEW_TB(
    review_id VARCHAR2(100) PRIMARY KEY,
    member_id VARCHAR2(100),
    foodtruck_id VARCHAR2(100),
    contents VARCHAR2(1000),
    score INT,
    writeDate DATE
);
ALTER TABLE REVIEW_TB
ADD FOREIGN KEY(member_id) REFERENCES member_tb(member_id);
ALTER TABLE REVIEW_TB
ADD FOREIGN KEY(foodtruck_id) REFERENCES foodtruck_tb(foodtruck_id) ON DELETE CASCADE;

INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'memberid', 'f01', '진짜 맛있는 푸드트럭(푸드트럭이 맛있는거 아님)0', 5, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'memberid', 'f01', '진짜 맛없는 푸드트럭(푸드트럭이 맛없는거 아님)1', 5, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'memberid', 'f01', '너네도 가봐라', 5, SYSDATE);

--DROP TABLE RECOMMAND_TB
CREATE TABLE RECOMMAND_TB(
    review_id VARCHAR2(100),
    member_id VARCHAR2(100),
    CONSTRAINT RECOMMAND_KEY PRIMARY KEY (review_id, member_id)
);
ALTER TABLE RECOMMAND_TB
ADD FOREIGN KEY(member_id) REFERENCES member_tb(member_id);
ALTER TABLE RECOMMAND_TB
ADD FOREIGN KEY(review_id) REFERENCES review_tb(review_id) ON DELETE CASCADE;

INSERT INTO RECOMMAND_TB VALUES('f01', 'memberid1');
INSERT INTO RECOMMAND_TB VALUES('f01', 'memberid2');
INSERT INTO RECOMMAND_TB VALUES('f01', 'memberid3');
INSERT INTO RECOMMAND_TB VALUES('f01', 'memberid4');
INSERT INTO RECOMMAND_TB VALUES('f01', 'memberid5');
--drop table report_tb
CREATE TABLE REPORT_TB(
    reporter_id VARCHAR(100),
    review_id VARCHAR(100),
    reason VARCHAR(300),
    CONSTRAINT RECOMMAND_pk PRIMARY KEY (review_id, reporter_id)
);
ALTER TABLE REPORT_TB
ADD FOREIGN KEY(reporter_id) REFERENCES member_tb(member_id) ON DELETE CASCADE;
ALTER TABLE REPORT_TB
ADD FOREIGN KEY(review_id) REFERENCES review_tb(review_id) ON DELETE CASCADE;

INSERT INTO REPORT_TB VALUES('memberid1', 'R01', '신기하게 이놈 리뷰만 보면 화가 치밀어오름');
INSERT INTO REPORT_TB VALUES('memberid2', 'R01', '패드립');

--DROP SEQUENCE PHOTO_SEQ;
CREATE SEQUENCE PHOTO_SEQ START WITH 1 INCREMENT by 1;
CREATE TABLE PHOTO_TB(
    photo_id VARCHAR2(100),
    review_id VARCHAR2(100),
    file_name VARCHAR2(100)
);

ALTER TABLE PHOTO_TB
ADD FOREIGN KEY(review_id) REFERENCES review_tb(review_id) ON DELETE CASCADE;