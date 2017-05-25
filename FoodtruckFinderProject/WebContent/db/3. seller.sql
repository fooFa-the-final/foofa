DROP TABLE seller_tb CASCADE CONSTRAINT;

CREATE TABLE seller_tb (
  seller_id varchar2(50) primary key not null,
  certification varchar2(50) not null,
  password varchar2(100),
  phone varchar2(50)
);


--판매자 자료입력​
insert into seller_tb (seller_id, certification, password, phone) values ('nacho', '2234567890', '1111', '01074432121');
insert into seller_tb (seller_id, certification, password, phone) values ('pasta', '3234567890', '2222', '01044832121');
insert into seller_tb (seller_id, certification, password, phone) values ('ginger', '1454567890', '3333', '01044632121');
insert into seller_tb (seller_id, certification, password, phone) values ('pudding', '2534567890', '4444', '01044132121');
insert into seller_tb (seller_id, certification, password, phone) values ('cholate', '7634567890', '5555', '01014432121');
insert into seller_tb (seller_id, certification, password, phone) values ('gem', '1234521890', '6666', '01044432121');
insert into seller_tb (seller_id, certification, password, phone) values ('jelly', '123452190', '7777', '01044432321');
insert into seller_tb (seller_id, certification, password, phone) values ('hotdog', '1234432890', '8888', '01044442121');
insert into seller_tb (seller_id, certification, password, phone) values ('noodle', '1234232890', '9999', '01044552121');
insert into seller_tb (seller_id, certification, password, phone) values ('candy', '1234569990', '4331', '01044476121');
insert into seller_tb (seller_id, certification, password, phone) values ('pizzaking', '1234567890', '4321', '01043232121');