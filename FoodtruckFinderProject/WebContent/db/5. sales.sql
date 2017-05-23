drop table sales_tb;
drop sequence sales_tb_seq;

create table sales_tb(
  sales_id varchar2(50),
  foodtruck_id varchar2(50),
  day varchar2(50),
  location varchar2(50),
  revenue int,
  PRIMARY KEY (sales_id)
);

ALTER TABLE sales_tb
ADD CONSTRAINT sales_tb_fk FOREIGN KEY(foodtruck_id)
REFERENCES foodtruck_tb(foodtruck_id) ON DELETE CASCADE;


CREATE SEQUENCE sales_tb_seq START WITH 1 INCREMENT BY 1;

insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'1','20170101','동작구',5000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'2','20160526','강서구',6000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'3','20160602','강동구',3000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'4','20160728','금천구',7000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'5','20160923','구로구',10000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'6','20170209','노원구',100000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'7','201703012','도봉구',5000000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'8','20170316','동대문구',300000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'9','20160917','강남구',750000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'10','20160530','강북구',52000);