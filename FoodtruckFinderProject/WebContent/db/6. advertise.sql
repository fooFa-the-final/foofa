--DROP TABLE ADV_tb CASCADE CONSTRAINT;
--DROP SEQUENCE ADVERTISE_SEQ_ADV;

create table adv_tb(
  adv_id varchar2(50) primary key,
  seller_id varchar2(50),
  period varchar2(50),
  start_date varchar2(50),
  confirm varchar2(1)
);

--시퀀스 생성

CREATE SEQUENCE ADVERTISE_SEQ_ADV START WITH 1 INCREMENT BY 1; 

--외래키설정
ALTER TABLE adv_tb
ADD FOREIGN KEY (seller_id) REFERENCES SELLER_TB(seller_id) on delete cascade;

--광고등록
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F1', '1', '2017052013', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F2', '4', '2017052113', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F3', '5', '2017052913', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F4', '3', '2017052611', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F5', '6', '2017052513', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F6', '3', '2017052213', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F6', '12', '2017052817', '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F7', '5', '2017052616', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F8', '6', '2017052513', '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F9', '9', '2017052413', '1');