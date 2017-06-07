DROP TABLE REVIEW_TB CASCADE CONSTRAINTS;
DROP SEQUENCE REVIEW_SEQ;
DROP TABLE RECOMMAND_TB CASCADE CONSTRAINTS;
drop table report_tb CASCADE CONSTRAINTS;
drop table PHOTO_tb CASCADE CONSTRAINTS;
DROP SEQUENCE PHOTO_SEQ;



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
VALUES ('R'||REVIEW_SEQ.nextVal, 'momo', 'F1', '진짜 맛있는 푸드트럭(푸드트럭이 맛있는거 아님)0', 5, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'sana', 'F1', '맛있었어요', 2, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'mina', 'F2', '너네도 가봐라', 3, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'nayeon', 'F2', '진짜 맛있는 푸드트럭(푸드트럭이 맛있는거 아님)0', 4, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'sana', 'F2', '진짜 맛없는 푸드트럭(푸드트럭이 맛없는거 아님)1', 1, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'mina', 'F3', '너네도 가봐라', 2, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'jihyo', 'F3', '진짜 맛있는 푸드트럭(푸드트럭이 맛있는거 아님)0', 5, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'jeongyeon', 'F4', '진짜 맛없는 푸드트럭(푸드트럭이 맛없는거 아님)1', 5, SYSDATE);
INSERT INTO REVIEW_TB
VALUES ('R'||REVIEW_SEQ.nextVal, 'nayeon', 'F5', '너네도 가봐라', 5, SYSDATE);

CREATE TABLE RECOMMAND_TB(
    review_id VARCHAR2(100),
    member_id VARCHAR2(100),
    CONSTRAINT RECOMMAND_KEY PRIMARY KEY (review_id, member_id)
);
ALTER TABLE RECOMMAND_TB
ADD FOREIGN KEY(member_id) REFERENCES member_tb(member_id);
ALTER TABLE RECOMMAND_TB
ADD FOREIGN KEY(review_id) REFERENCES review_tb(review_id) ON DELETE CASCADE;

INSERT INTO RECOMMAND_TB VALUES('R1', 'mina');
INSERT INTO RECOMMAND_TB VALUES('R1', 'sana');
INSERT INTO RECOMMAND_TB VALUES('R1', 'nayeon');
INSERT INTO RECOMMAND_TB VALUES('R2', 'dahyun');
INSERT INTO RECOMMAND_TB VALUES('R2', 'tzuyu');

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


INSERT INTO REPORT_TB VALUES('jeongyeon', 'R1', '신기하게 이놈 리뷰만 보면 화가 치밀어오름');
INSERT INTO REPORT_TB VALUES('sana', 'R2', '패드립');


CREATE SEQUENCE PHOTO_SEQ START WITH 1 INCREMENT by 1;
CREATE TABLE PHOTO_TB(
    photo_id VARCHAR2(100),
    review_id VARCHAR2(100),
    file_name VARCHAR2(100)
);

ALTER TABLE PHOTO_TB
ADD FOREIGN KEY(review_id) REFERENCES review_tb(review_id) ON DELETE CASCADE;

INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R1','food01.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R2','food02.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R3','food03.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R4','food04.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R5','food05.jpeg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R6','food06.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R7','food07.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R8','food08.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R1','food08.jpg');
INSERT INTO PHOTO_TB VALUES('P'||PHOTO_SEQ.NEXTVAL,'R1','food07.jpg');


commit;
