CREATE SEQUENCE menu_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE menu_tb(
	menu_id VARCHAR2(100) PRIMARY KEY,
	menu_name VARCHAR2(100),
	price NUMBER,
	menu_state VARCHAR2(1),
	foodtruck_id VARCHAR2(100)
);

ALTER TABLE menu_tb
ADD FOREIGN KEY(foodtruck_id) REFERENCES foodtruck_tb(foodtruck_id) on delete cascade;

--DATA INSERT
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '새우요리', 10000, '1', 'F1');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '닭고기요리', 10000, '1', 'F1');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '소고기요리', 10000, '1', 'F1');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '새우요리', 10000, '1', 'F2');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '닭고기요리', 10000, '1', 'F2');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '오리고기요리', 10000, '1', 'F2');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '해산물요리', 10000, '0', 'F3');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '버섯요리', 10000, '1', 'F3');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '전복요리', 10000, '1', 'F3');
INSERT INTO menu_tb(menu_id, menu_name, price, menu_state, foodtruck_id) VALUES ('M'||menu_seq.NEXTVAL, '새우요리', 10000, '1', 'F3');

COMMIT;