## Q&A

1.1. “SELECT * FROM product WHERE category_id = 1 AND active_status = TRUE ORDER BY created_timestamp DESC LIMIT 20 , 100” หมายความว่าอะไร
ANS ให้ทำการดึงข้อมูลของ Product ด้วยเงื่อนไข Category ID เป็น 1 และ Active Status เป็น TRUE และทำการเรียงลำดับจากมากไปหาน้อยดูจาก Field created_timestamp และจะทำการดึงข้อมูล 100 ตัวตั้งแต่ตัวที่ 20

1.2. จงยกตัวอย่างการ INSERT ข้อมูล กรณีที่มีข้อมูลที่เป็น primary key ซ้ำกัน
ANS INSERT INTO customer(id, name) VALUES (1, "Lek"), INSERT INTO customer(id, name) VALUES (2, "Lek") หรือ INSERT INTO customer(id, name) VALUES (3, "Lek")

1.3. จงยกตัวอย่างการ INSERT ข้อมูล กรณีที่มีข้อมูล 100,000 row
ANS DELIMITER //

CREATE PROCEDURE MultipleInsert()
BEGIN
	SET @cnt = 0;
	WHILE @cnt < 100000 DO
		SET @cnt = @cnt + 1;
		SET @insName = CONCAT('Test #', @cnt);
	
		INSERT INTO customer(name) values(@insName);	
	END WHILE;
END //

DELIMITER ;

CALL MultipleInsert();

1.4. จงยกตัวอย่างการ UPDATE ข้อมูล กรณีที่มีข้อมูล 3000 row และมี primary ที่แตกต่างกันทุก row
ANS

1.5. Index คืออะไร และยกตัวอย่างวิธีการใช้งาน โดยมีตารางมี field ดังนี้ id, name, address, phone, email, active_status, created_timestamp, updated_timestamp
ANS คือการระบุตำแหน่งในการเปรียบเทียบข้อมูล ซึ่งถ้าใช้งานจะทำให้ค้นหาด้วยข้อมูลนั้นๆ ได้รวดเร็วขึ้น / ALTER TABLE x ADD INDEX(id, active_status);

1.6. จากข้อ 5 ถ้าต้องการค้นหาข้อมูล id , name , phone , email โดยที่ active_status = FALSE ควรจะต้องทำ index เช่นใด
ANS ALTER TABLE x ADD INDEX(active_status);

1.7. จากข้อ 5 ถ้าต้องการค้นหา id = 6 ควรทำ index เช่นใด
ANS ALTER TABLE x ADD INDEX(id);

1.8. Trigger คืออะไร และยกตัวอย่าง
ANS Trigger คือการดัก Event ก่อนหรือหลังการทำงาน Insert, Update หรือ Delete

EX. สร้าง Trigger เพื่อดูชื่อก่อนการเปลี่ยนและหลังการเปลี่ยนแปลง
CREATE TRIGGER Update_CName AFTER UPDATE ON customer FOR EACH ROW 
SET @NewName = NEW.name, @OldName = OLD.name

วิธีการเรียกใช้งาน
SET @NewName = "", @OldName = "";
UPDATE customer SET name="teelekkub" WHERE id=1;
SELECT @NewName AS NewName, @OldName AS OldName;

### จงทำตามคำสั่งข้างล่างนี้

2.1 ทำการสร้าง Key, Index ให้เหมาะสม (ส่งผลลัพท์เป็น SQL)
ANS ALTER TABLE orders ADD INDEX(customer_id, order_id); (SQL file : develop.sql)

2.2 ต้องการ Query ให้ได้ผลลัพท์ดังตารางข้างล่างนี้โดยใช้คำสั่ง SQL เพียงอย่างเดียว (ratio คือสัดส่วนของยอดซื้อของลูกค้า 1 คน หารด้วยยอดซื้อทั้งหมดของตาราง orders)
ANS SELECT customer.id AS id, customer.name AS name, COUNT(DISTINCT orders.order_id) AS total_order, COUNT(orders.item) as total_item, SUM(orders.price) AS total_price, (SUM(orders.price) / (SELECT SUM(orders.price) FROM orders)) AS ratio
FROM customer 
LEFT JOIN orders ON orders.customer_id = customer.id
GROUP BY customer.id


