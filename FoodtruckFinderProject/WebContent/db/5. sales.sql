drop table sales_tb CASCADE CONSTRAINTS;
drop sequence sales_tb_seq;

create table sales_tb(
  sales_id varchar2(50),
  foodtruck_id varchar2(50),
  day date,
  location varchar2(50),
  revenue number,
  PRIMARY KEY (sales_id)
);

ALTER TABLE sales_tb
ADD FOREIGN KEY(foodtruck_id) REFERENCES foodtruck_tb(foodtruck_id) ON DELETE CASCADE;

CREATE SEQUENCE sales_tb_seq START WITH 1 INCREMENT BY 1;

insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F1','2017-01-01','동작구',5000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F2','2016-05-26','강서구',6000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F3','2016-06-02','강동구',3000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F4','2016-07-28','금천구',7000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F5','2016-09-23','구로구',10000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F6','2017-02-09','노원구',100000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F7','2017-03-12','도봉구',5000000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F8','2017-03-16','동대문구',300000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F9','2016-09-17','강남구',750000);
insert into sales_tb (sales_id,foodtruck_id,day,location,revenue) values (sales_tb_seq.nextval,'F1','2016-05-30','강북구',52000);

commit;