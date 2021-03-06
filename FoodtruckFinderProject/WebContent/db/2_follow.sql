DROP TABLE FOLLOW_TB CASCADE CONSTRAINT;

CREATE TABLE FOLLOW_TB (
from_id varchar(100),
to_id varchar(100),
  PRIMARY KEY (from_id,to_id)
);

ALTER TABLE follow_tb
ADD FOREIGN KEY(from_id) REFERENCES member_tb(member_id)  ON DELETE CASCADE;
ALTER TABLE follow_tb
ADD FOREIGN KEY(to_id) REFERENCES member_tb(member_id) ON DELETE CASCADE;
insert into follow_tb(from_id, to_id) values ('momo', 'mina');
insert into follow_tb(from_id, to_id) values ('dahyun', 'momo');
insert into follow_tb(from_id, to_id) values ('mina', 'dahyun');
insert into follow_tb(from_id, to_id) values ('jeongyeon', 'sana');
insert into follow_tb(from_id, to_id) values ('tzuyu', 'mina');
insert into follow_tb(from_id, to_id) values ('momo', 'dahyun');
insert into follow_tb(from_id, to_id) values ('jihyo', 'momo');
insert into follow_tb(from_id, to_id) values ('mina', 'tzuyu');
insert into follow_tb(from_id, to_id) values ('chaeyeong', 'sana');
insert into follow_tb(from_id, to_id) values ('sana', 'momo');





commit;