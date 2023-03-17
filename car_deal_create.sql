--Dealership Database Tables Creation

--Dealership Table Creation
create table dealership(
	dealership_id SERIAL PRIMARY KEY,
	dealership_name VARCHAR(150),
	address VARCHAR(150)
);

 -- Customer Table Creation
create table customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	address VARCHAR(150),
	email VARCHAR(150),
	phone VARCHAR(15)
 );
 
 --Salesperson Table Creation
CREATE TABLE salesPerson(
	sales_person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	dealership_id INTEGER,
	FOREIGN KEY (dealership_id) references dealership(dealership_id)
);

--Car Table Creation
CREATE TABLE car(
	car_id SERIAL PRIMARY KEY, 
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_price NUMERIC(12,2)
);

-- Service History Table Creation
CREATE TABLE serviceHistory(
	service_history_id SERIAL PRIMARY KEY,
	date_completed INTEGER,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

-- Invoice Table Creation
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	total_cost NUMERIC(5,2),
	sales_person_id  INTEGER,
	car_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(sales_person_id) REFERENCES salesPerson(sales_person_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Service Technician Table Creation
CREATE TABLE serviceTechnician(
	tech_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

--Services Table Creation
CREATE TABLE services(
	services_id SERIAL PRIMARY KEY,
	services_name VARCHAR(150),
	services_rate VARCHAR(100)
);

-- Parts Table Creation
CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	parts_name VARCHAR(150),
	parts_cost NUMERIC(5,2)
);

-- Inventory Parts Table Creation
CREATE TABLE inventoryParts(
	inventory_id SERIAL PRIMARY KEY,
	instock_parts VARCHAR(5),
	parts_id INTEGER,
	FOREIGN KEY(parts_id) REFERENCES parts(parts_id)
);

-- Service Order Table Creation
CREATE TABLE serviceOrder(
	service_order_id SERIAL PRIMARY KEY,
	finish_date INTEGER,
	car_issue VARCHAR(250),
	customer_id INTEGER,
	car_id INTEGER,
	services_id INTEGER,
	tech_id INTEGER,
	parts_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(services_id) REFERENCES services(services_id),
	FOREIGN KEY(tech_id) REFERENCES serviceTechnician(tech_id),
	FOREIGN KEY(parts_id) REFERENCES parts(parts_id)
);

