DROP TABLE member_tb CASCADE CONSTRAINTS;

CREATE TABLE member_tb (
  member_id varchar2(100),
  password varchar2(100),
  birthday varchar2(100),
  email varchar2(100),
  gender varchar2(50),
  image_src varchar2(300),
  PRIMARY KEY (member_id)
);

insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('momo', '1234', '19930328', 'zbvld@naver.com','F','profile1.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('nayeon', '1234', '19931111', 'taewin@gmail.com','F','profile2.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('jeongyeon', '1234', '19990128', 'susd@daum.com','F','profile3.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('sana', '1234', '19940123', 'wingun@naver.com','F','profile4.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('jihyo', '1234', '19911122', 'rere@naver.com','F','profile5.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('mina', '1234', '19920428', 'boxer@naver.com','F','profile6.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('dahyun', '1234', '19960313', 'diedie@gmail.com','F','profile7.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('chaeyeong', '1234', '19950817', 'niconiconi@naver.com','F','profile8.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('tzuyu', '1234', '19900924', 'red@naver.com','F','profile9.jpg');
insert into member_tb(member_id, password, birthday, email, gender, image_src) values ('admin', 'admin', 'admin', 'admin','M','admin');

commit;