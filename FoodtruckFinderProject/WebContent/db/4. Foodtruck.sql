--DROP TABLE foodtruck_tb CASCADE CONSTRAINTS;
--DROP TABLE favorite CASCADE CONSTRAINTS;
--DROP SEQUENCE truck_seq;


CREATE SEQUENCE truck_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE foodtruck_tb(
foodtruck_id VARCHAR2(100) PRIMARY KEY,
seller_id VARCHAR2(100),
truckName VARCHAR2(100),
truck_image VARCHAR2(100),
truckHour VARCHAR2(100),
area VARCHAR2(100),
notice VARCHAR2(300),
location VARCHAR2(100),
category VARCHAR2(100),
payment VARCHAR2(1),
parking VARCHAR2(1),
drinking VARCHAR2(1),
catering VARCHAR2(1),
operation_state VARCHAR2(1)
);

ALTER TABLE foodtruck_tb
ADD FOREIGN KEY(seller_id) REFERENCES seller_tb(seller_id) on delete cascade;

--DATA INSERT
INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'nacho', 'nacho트럭', '', '17002000', '서울 금천구', '안녕하세요', '서울 금천구 시흥대로 198', '브라질', '0', '0', '0', '1', '1');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'pasta', 'pasta트럭', '', '17002000', '경기도 평택시', '반갑습니다', '경기도 평택시 참이슬길 13', '양식', '0', '1', '0', '1', '1');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'pudding', 'pudding트럭', '', '17002000', '경기도 수원시', '푸딩먹으러오세요', '경기도 수원시 111로', '카페', '1', '1', '0', '0', '0');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'ginger', 'ginger트럭', '', '17002000', '서울 용산구', '오늘은 쉽니다', '서울 용산구 000로', '음료', '0', '0', '0', '0', '0');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'cholate', 'chocolate트럭', '', '17002000', '서울 관악구', '초콜릿먹으러오세요', '서울 관악구 333로', '카페', '1', '0', '1', '0', '1');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'gem', 'gem트럭', '', '17002000', '대전 둔산동', '맛있어여', '대전 둔산동 999로', '기타', '1', '1', '1', '1', '1');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'jelly', 'jelly트럭', '', '17002000', '충남 천안시', '젤리먹으러오세요', '충남 천안시 555로', '기타/카페', '1', '1', '0', '0', '0');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'hotdog', 'hotdog트럭', '', '17002000', '제주 제주시', '핫도그먹으러오세요', '제주 제주시 홍랑길 23', '양식/퓨전', '0', '1', '1', '1', '0');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'noodle', 'noodle트럭', '', '17002000', '서울 금천구', '면먹으러오세요', '서울 금천구 시흥대로 198', '베트남', '0', '1', '0', '1', '1');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'candy', 'candy트럭', '', '17002000', '서울 금천구', '사탕먹으러오세요', '서울 금천구 시흥대로 150', '기타', '0', '1', '0', '1', '0');

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, truckHour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq.nextval, 'pizzaking', 'pizzaking트럭', '', '17002000', '서울 금천구', '피자먹으러오새요', '서울 금천구 시흥대로 200', '양식', '1', '1', '0', '1', '0');