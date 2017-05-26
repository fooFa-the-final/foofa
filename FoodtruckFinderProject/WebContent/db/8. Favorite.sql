	DROP TABLE favorite CASCADE CONSTRAINTS;
	
	CREATE TABLE favorite(
	foodtruck_id VARCHAR2(100),
	member_id VARCHAR2(100),
	constraint FAV_KEY PRIMARY KEY (foodtruck_id, member_id)
	);
	
	
	ALTER TABLE favorite
	ADD FOREIGN KEY(foodtruck_id) REFERENCES foodtruck_tb(foodtruck_id) on delete cascade;
	
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F1', 'momo');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F1', 'nayeon');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F1', 'jeongyeon');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F2', 'sana');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F2', 'jihyo');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F2', 'mina');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F2', 'dahyun');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F3', 'chaeyeong');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F3', 'tzuyu');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F4', 'tzuyu');
	INSERT INTO favorite(foodtruck_id, member_id) VALUES ('F4', 'momo');
	
	
	COMMIT;