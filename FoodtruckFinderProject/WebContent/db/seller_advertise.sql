drop table seller_tb;
drop table adv_tb;

CREATE TABLE seller_tb (
  seller_id varchar2(50) primary key not null,
  certification varchar2(50) not null,
  password varchar2(100),
  phone varchar2(50)
);

create table adv_tb(
  adv_id varchar2(50) primary key,
  foodtruck_id varchar2(50),
  period varchar2(50),
  start_date date,
  confirm varchar2(1)
);

--시퀀스 생성

CREATE SEQUENCE ADVERTISE_SEQ_ADV START WITH 1 INCREMENT BY 1; 

--외래키설정
--ALTER TABLE adv_tb
--ADD FOREIGN KEY (foodtruck_id) REFERENCES FOODTRUCK_TB(foodtruck_id) on update cascade on delete set null;


--판매자 자료입력​
insert into seller_tb (seller_id, certification, password, phone) values ('nacho', '2234567890', '1111', '01074432121');
insert into seller_tb (seller_id, certification, password, phone) values ('pasta', '3234567890', '2222', '01044832121');
insert into seller_tb (seller_id, certification, password, phone) values ('ginger', '1454567890', '3333', '01044632121');
insert into seller_tb (seller_id, certification, password, phone) values ('pudding', '2534567890', '4444', '01044132121');
insert into seller_tb (seller_id, certification, password, phone) values ('chocholate', '7634567890', '5555', '01014432121');
insert into seller_tb (seller_id, certification, password, phone) values ('gem', '1234521890', '6666', '01044432121');
insert into seller_tb (seller_id, certification, password, phone) values ('jelly', '123452190', '7777', '01044432321');
insert into seller_tb (seller_id, certification, password, phone) values ('hotdog', '1234432890', '8888', '01044442121');
insert into seller_tb (seller_id, certification, password, phone) values ('noodle', '1234232890', '9999', '01044552121');
insert into seller_tb (seller_id, certification, password, phone) values ('candy', '1234569990', '4331', '01044476121');
insert into seller_tb (seller_id, certification, password, phone) values ('pizzaking', '1234567890', '4321', '01043232121');


--광고등록
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F1', '1', SYSDATE, '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F2', '4', SYSDATE, '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F3', '5', SYSDATE, '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F4', '3', SYSDATE, '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F5', '6', SYSDATE, '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F6', '3', SYSDATE, '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F6', '12', SYSDATE, '1');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F7', '5', SYSDATE, '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F8', '6', SYSDATE, '0');
insert into adv_tb VALUES ('A'||ADVERTISE_SEQ_ADV.NEXTVAL, 'F9', '9', SYSDATE, '1');