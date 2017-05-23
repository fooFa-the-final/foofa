--DROP TABLE foodtruck_tb;
--DROP SEQUENCE truck_seq;

CREATE SEQUENCE truck_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE foodtruck_tb(
foodtruck_id VARCHAR2(100) PRIMARY KEY,
seller_id VARCHAR2(100),
truckName VARCHAR2(100),
truck_image VARCHAR2(100),
hour VARCHAR2(100),
area VARCHAR2(100),
notice VARCHAR2(300),
location VARCHAR2(100),
category VARCHAR2(100),
payment boolean,
parking boolean,
drinking boolean,
catering boolean,
operation_state boolean
);

ALTER TABLE foodtruck_tb
ADD FOREIGN KEY(seller_id) REFERENCES seller_tb(seller_id) on delete cascade;

INSERT INTO foodtruck_tb(foodtruck_id, seller_id, truckName, truck_image, hour, area, notice, location, category, payment, parking, drinking, catering, operation_state)
VALUES ('F'||truck_seq, 'seller111', '은행골', '', '17002000', '서울 금천구', '은행골 참치', '서울 금천구 시흥대로 198', '일식', TRUE, TRUE, FALSE, FALSE, TRUE);