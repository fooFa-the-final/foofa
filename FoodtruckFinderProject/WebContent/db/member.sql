--DROP TABLE MEMBER_TB;

CREATE TABLE member_tb (
  member_id varchar2(100),
  password varchar2(100),
  birth varchar2(100),
  email varchar2(100),
  gender varchar2(100),
  image_src varchar2(300),
  PRIMARY KEY (member_id)
);

insert into member_tb(member_id, password, birth, email, gender, image_src) values ('momo', '1234', '19930328', 'zbvld@naver.com','여자','ddddd.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('nayeon', '1234', '19931111', 'taewin@gmail.com','여자','aaaaa.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('jeongyeon', '1234', '19990128', 'susd@daum.com','여자','cccc.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('sana', '1234', '19940123', 'wingun@naver.com','여자','bbbb.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('jihyo', '1234', '19911122', 'rere@naver.com','여자','fffff.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('mina', '1234', '19920428', 'boxer@naver.com','여자','gggg.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('dahyun', '1234', '19960313', 'diedie@gmail.com','여자','wwww.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('chaeyeong', '1234', '19950817', 'niconiconi@naver.com','여자','eeee.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('tzuyu', '1234', '19900924', 'red@naver.com','여자','yyyy.jpg');
insert into member_tb(member_id, password, birth, email, gender, image_src) values ('admin', 'admin', 'admin', 'admin','남자','admin');




commit;