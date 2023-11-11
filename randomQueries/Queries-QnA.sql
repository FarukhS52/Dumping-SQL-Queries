-- 1- Show first name and last name of patients that weigh within the range of 100 to 120 (inclusive).

   select first_name, last_name from patients
   where weight between 100 and 120;



-- 2. Show the city, company_name, contact_name of all customers from cities that contain the letter 'L' in the city name, sorted by contact_name

   select city ,company_name, contact_name from customers
   where city  like '%L%'
   order by contact_name ASC;


-- 3. Show the first_name, last_name, and height of the patient with the greatest height.

   select  max( height) as height , first_name , last_name 
   from patients ;


-- 4. Show all columns for patients with one of the following patient_ids:<br> 1,45,534,879,1000.

   select * from patients 
   where patient_id in (1, 45, 534, 879, 1000);


-- 5. Show the patient_id and the total number of admissions for patient_id 579 with the count column having the alias total_admissions

   select patient_id , count(patient_id) as total_admissions
   from admissions
   where patient_id = 579;
   
   
-- 6. Retrieve US customers' names and countries, ordered by first name.

   select FirstName ,  Country 
   from Customer
   where Country = 'USA'
   order by FirstName asc;
   
-- 7. Fetch unique customer cities in alphabetical order

Select Distinct(City) from Customer
order by City ASC; 


-- 8. Show all the columns from admissions where the patient was admitted and discharged on the same day.


   select * from admissions
   where admission_date = discharge_date;  
   
   
-- 9. Show all the even numbered Order_id from the orders table

   select Order_id from orders
   where MOD(Order_id,2)=0;
   
-- 10. Retrieve track names and album IDs for tracks over 5 minutes

   select AlbumId  ,Name 
   from Track
   where Milliseconds >300000
   order by Name ASC;
 
-- 11. Show the average unit price rounded to 2 decimal places, the total units in stock,
-- total discontinued products from the products table. The column names must be average_price, total_stock, total_discontinued

   SELECT
  ROUND(AVG(unit_price), 2) AS average_price,
  SUM(units_in_stock) AS total_stock,
  SUM(discontinued) AS total_discontinued
  FROM
  products;

