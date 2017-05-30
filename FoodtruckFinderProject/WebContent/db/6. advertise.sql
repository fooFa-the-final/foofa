DROP TABLE ADV_tb CASCADE CONSTRAINT;
DROP SEQUENCE ADVERTISE_SEQ_ADV;

create table adv_tb(
  adv_id varchar2(50) primary key,
  seller_id varchar2(50),
  period NUMBER,
  start_date DATE,
  confirm varchar2(1)
);

--시퀀스 생성

CREATE SEQUENCE ADVERTISE_SEQ_ADV START WITH 1 INCREMENT BY 1; 

--외래키설정
ALTER TABLE adv_tb
ADD FOREIGN KEY (seller_id) REFERENCES SELLER_TB(seller_id) on delete cascade;

--광고등록
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'nacho', '1', '17/05/20', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'pasta', '4', '17/05/21', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'ginger', '5', '17/05/29', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'pudding', '3', '17/05/26', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'cholate', '6', '17/05/25', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'gem', '3', '17/05/22', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'jelly', '12', '17/05/28', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'hotdog', '5', '17/05/26', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'noodle', '6', '17/05/25', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'candy', '9', '17/05/24', '1');