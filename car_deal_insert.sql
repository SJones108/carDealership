insert into dealership(
	dealership_id,
	dealership_name,
	address
) values (
	12,
	'The Motor Mouths',
	'601 North Lincoln Road., Escanaba, MI 48796'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	email,
	phone
)values(
	1,
	'Leah',
	'Laska',
	'2435 North 3rd Street., Rock, MI 47869',
	'llaska@hotmail.com',
	'906-789-3412'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	email,
	phone
)values(
	2,
	'LeAnne',
	'Gartland',
	'25 South Ludington., Wells, MI 49469',
	'leanneG@yahoo.com',
	'906-786-5412'
);

select * from customer;

insert into salesPerson(
	sales_person_id,
	first_name,
	last_name,
	dealership_id
)values(
	1,
	'Rhonda',
	'Goodwin',
	12
);

insert into salesPerson(
	sales_person_id,
	first_name,
	last_name,
	dealership_id
)values(
	2,
	'Wyatt',
	'Myles',
	12
);

select * from salesPerson;

CREATE OR REPLACE PROCEDURE carCreate(
	car_id INTEGER,
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_price NUMERIC(12,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car
	VALUES(car_id, car_color, car_make,car_model, car_year, car_price);
COMMIT;
END;
$$

CREATE OR REPLACE PROCEDURE service_historyCreate(
	car_id INTEGER,
	service_history_id INTEGER,
	date_completed VARCHAR(50)	
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car
	VALUES(car_id, car_color, car_make,car_model, car_year, car_price);
COMMIT;
END;
$$
 
CALL carCreate(
	'1',
	'Teal',
	'Jeep',
	'Wrangler',
	'2023',
	'32600.00'
)

CALL carCreate(
	'2',
	'Heavenly White',
	'Toyota',
	'RAV4',
	'2020',
	'42000.00'
)

--CREATING PROCEDURE FOR PARTS TABLE
CREATE OR REPLACE PROCEDURE infoForPart(
	parts_id INTEGER,
	parts_name VARCHAR(100),
	parts_cost NUMERIC(5,2)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO parts
	VALUES(parts_id, parts_name, parts_cost);
	COMMIT;
END;
$$

CALL infoForPart(1,'Serpentine Belt',24.95);
CALL infoForPart(2,'floormats',150.97);

SELECT * 
FROM parts;
--^^end of parts table^^
--CREATING PROCEDURE FOR PARTS_USED TABLE
CREATE OR REPLACE PROCEDURE inventoryParts(
	inventory_id INTEGER,
	instock_parts VARCHAR,
	parts_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO inventoryParts
	VALUES(inventory_id, instock_parts, parts_id);
	COMMIT;
END;
$$

CALL inventoryParts(1, 'Yes', 1);
CALL inventoryParts(2, 'Out', 2);

SELECT *
FROM inventoryParts;
--^^end of inventoryParts table^^
--CREATING PROCEDURE FOR SERVICES TABLE
CREATE OR REPLACE PROCEDURE updateService(
	services_id INTEGER,
	services_name VARCHAR(150),
	services_rate VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO services
	VALUES(services_id,services_name,services_rate);
	COMMIT;
END;
$$

CALL updateService(1,'Replace filter','$19/hr');
CALL updateService(2,'Replace sparkplugs','$20/hr');

SELECT * 
FROM services;
--^^end of services table^^
--CREATING PROCEDURE FOR SERVICE TECHNICIAN TABLE
CREATE OR REPLACE PROCEDURE serviceTechnician(
	tech_id INTEGER,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO serviceTechnician
	VALUES(tech_id,first_name,last_name);
	COMMIT;
END;
$$

CALL serviceTechnician(1,'Eric','Goodwin');
CALL serviceTechnician(2,'Jimmy','Strong');

SELECT *
FROM serviceTechnician;
--^^end of service technician table^^

--CREATING PROCEDURE FOR SERVICE ORDER TABLE
CREATE OR REPLACE PROCEDURE serviceOrder(
	service_order_id INTEGER,
	finish_date VARCHAR(50),
	car_issue VARCHAR(150),
	customer_id INTEGER,
	car_id INTEGER,
	services_id INTEGER,
	tech_id INTEGER,
	parts_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO serviceOrder
	VALUES(service_order_id,finish_date,car_issue,customer_id,car_id,services_id,tech_id,parts_id);
	COMMIT;
END;
$$

CALL serviceOrder(1,'2023-03-11','Needs new filter',1,1,1,1,1);
CALL serviceOrder(2,'2023-03-12','Needs new sparkplugs',2,2,2,2,2);

select * 
from serviceOrder;
--^^end of service to mechanic table^^
--CREATING DATA FOR INVOICE TABLE
insert into invoice(
	invoice_id,
	invoice_date,
	total_cost,
	sales_person_id,
	car_id,
	customer_id
)
values(
	1,
	'2023-03-17',
	'167.98',
	1,
	1,
	1
);

insert into invoice(
	invoice_id,
	invoice_date,
	total_cost,
	sales_person_id,
	car_id,
	customer_id
)
values(
	2,
	'2023-03-12',
	'467.98',
	2,
	2,
	2
);
--^^end of invoice table^^
--CREATING PROCEDURE FOR SERVICE_HISTORY TABLE
CREATE OR REPLACE PROCEDURE ServiceHistory(
	service_history_id INTEGER,
	date_completed VARCHAR(10),
	car_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO serviceHistory
	VALUES(service_history_id,date_completed,car_id);
	COMMIT;
END;
$$

CALL serviceHistory(1,'03/17/2023',1);
CALL serviceHistory(2,'10/12/2023',2);

select* 
from serviceHistory;

