-- Create the departments table

CREATE TABLE departments (

id SERIAL PRIMARY KEY, -- Unique ID for each course

name VARCHAR(100) NOT NULL -- Name of the course

);



-- Create the mangers table

CREATE TABLE mangers (

id SERIAL PRIMARY KEY, -- Unique ID for each manger

name VARCHAR(50) NOT NULL ,-- Name of the manger

department_id INT REFERENCES departments(id) -- Foreign key linking to the departments table

);




-- Create the suppliers table


CREATE TABLE suppliers (

id SERIAL PRIMARY KEY, -- Unique ID for each supplier

name VARCHAR(50) NOT NULL ,-- Name of the supplier

status INT NOT NULL
);


-- Create the employees table

CREATE TABLE employees (

id SERIAL PRIMARY KEY, -- Unique ID for each employee record

fname VARCHAR(50) NOT NULL ,-- first Name of the employee

lname VARCHAR(50) NOT NULL ,--last  Name of the employee

salary INT NOT NULL,

manger_id INT REFERENCES mangers(id), -- Foreign key linking to the students table

department_id INT REFERENCES departments(id) -- Foreign key linking to the courses table

);


-- Insert sample data into the departments table

INSERT INTO departments (id, name ) VALUES
 (1050,'HR'),
    (1030,'Operations'),
    (1020,'Quality'),
    (1080,'Logistics'),
    (1060, 'IT' ),
    (1070,'Product Management'),
    (1010,'Customer Service');

-- Insert sample data into the mangers table

INSERT INTO suppliers ( name , status) VALUES

 ('mosaad',10),
    ('ismael',12),
    ('yousef',15),
    ('hytham',17),
    ('omar',25),
    ('ali' ,90),
    ('ali' ,70),
    ('amr',36);



-- Insert sample data into the suppliers table

INSERT INTO mangers (id, name , department_id) VALUES

 (100,'mosaad',1050),
    (110,'ismael',1030),
    (150,'yousef',1020),
    (200,'hytham',1080),
    (300,'omar',1060),
    (250,'ali' ,1070),
    (250,'ali' ,1070),
    (350,'amr',1010);

ALTER TABLE employees
ADD hours INT ;


-- Insert sample data into the employees table

INSERT INTO employees (fname, lname, salary,manger_id,department_id,hours) VALUES

('omar','hassan',5000,100,1050,8),
('emad','mohsen',2500,110,1030,8),
('ali','gomaa',3000,150,1020,8),
('sara', 'amr' ,4000,200,1080,8),
('gamal','hegazy',3500,300,1060,8),
('jana','ammar',2000,250,1070,8),
('seif','ali',5000,350,1010,8);



INSERT INTO departments (id, name ) VALUES
(5,'CEO');

INSERT INTO employees (fname, lname, salary,manger_id,department_id,hours) VALUES

('salah','ali',60000,100,5,8);



/*
Question 1: 
Create a simple view named vw_employee_details that displays the first name, last name, and 
department name of employees
*/
CREATE VIEW vw_employee_details AS
SELECT e.fname ,
		e.lname,
		d.name AS department_name 
FROM employees e
JOIN departments d ON d.id = e.department_id



-- query to retreve view 
SELECT * FROM vw_employee_details



/*
Question2: 
Modify the existing view vw_work_hrs to only include employees working in department 
number 5. 
Instructions: 
1. Use the CREATE OR REPLACE VIEW statement to update the view. 
2. Filter the results using the WHERE clause to include only employees with department 
number 5. 
3. Ensure that the columns selected are fname, lname, dname, and hours.
*/

CREATE VIEW vw_work_hrs AS
SELECT e.fname ,
		e.lname,
		hours,
		d.name AS department_name 
FROM employees e
JOIN departments d ON d.id = e.department_id
WHERE d.id = 5


-- query to retreve view 

SELECT * FROM vw_work_hrs



/*
Question 3: 
Create a view named vw_high_status_suppliers to display all suppliers with a status greater 
than 15, and ensure that any updates or inserts through the view still meet the status condition. 
Instructions: 
1. Use the CREATE VIEW statement to define the view. 
2. Include the WITH CHECK OPTION to enforce that all modifications through the view 
adhere to the condition that status must be greater than 15. 
3. Use a SELECT statement to pull all columns from the suppliers table.
*/


CREATE VIEW vw_high_status_suppliers AS
SELECT * FROM suppliers
WHERE status > 15
WITH CHECK OPTION 

-- query to retreve view 
SELECT * FROM vw_high_status_suppliers


INSERT INTO vw_high_status_suppliers (name , status )
values ('mohamed', 20 )

