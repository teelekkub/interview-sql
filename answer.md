1.1. “SELECT * FROM product WHERE category_id = 1 AND active_status = TRUE ORDER BY created_timestamp DESC LIMIT 20 , 100” หมายความว่าอะไร
ANS ให้ทำการดึงข้อมูลของ Product ด้วยเงื่อนไข Category ID เป็น 1 และ Active Status เป็น TRUE และทำการเรียงลำดับจากมากไปหาน้อยดูจาก Field created_timestamp และจะทำการดึงข้อมูล 100 ตัวตั้งแต่ตัวที่ 20

1.2. จงยกตัวอย่างการ INSERT ข้อมูล กรณีที่มีข้อมูลที่เป็น primary key ซ้ำกัน
ANS INSERT INTO customer(id, name) VALUES (1, "Lek"), INSERT INTO customer(id, name) VALUES (2, "Lek") หรือ INSERT INTO customer(id, name) VALUES (3, "Lek")

1.3. จงยกตัวอย่างการ INSERT ข้อมูล กรณีที่มีข้อมูล 100,000 row
ANS 

1.4. จงยกตัวอย่างการ UPDATE ข้อมูล กรณีที่มีข้อมูล 3000 row และมี primary ที่แตกต่างกันทุก row
ANS

1.5. Index คืออะไร และยกตัวอย่างวิธีการใช้งาน โดยมีตารางมี field ดังนี้ id, name, address, phone, email, active_status, created_timestamp, updated_timestamp
ANS 

1.6. จากข้อ 5 ถ้าต้องการค้นหาข้อมูล id , name , phone , email โดยที่ active_status = FALSE ควรจะต้องทำ index เช่นใด
ANS 

1.7. จากข้อ 5 ถ้าต้องการค้นหา id = 6 ควรทำ index เช่นใด
ANS 

1.8. Trigger คืออะไร และยกตัวอย่าง
ANS

2.1 ทำการสร้าง Key, Index ให้เหมาะสม (ส่งผลลัพท์เป็น SQL)
ANS 

2.2 ต้องการ Query ให้ได้ผลลัพท์ดังตารางข้างล่างนี้โดยใช้คำสั่ง SQL เพียงอย่างเดียว (ratio คือสัดส่วนของยอดซื้อของลูกค้า 1 คน หารด้วยยอดซื้อทั้งหมดของตาราง orders)
ANS SELECT customer.id AS id, customer.name AS name, COUNT(DISTINCT orders.order_id) AS total_order, COUNT(orders.item) as total_item, SUM(orders.price) AS total_price, (SUM(orders.price) / (SELECT SUM(orders.price) FROM orders)) AS ratio
FROM customer 
LEFT JOIN orders ON orders.customer_id = customer.id
GROUP BY customer.id


