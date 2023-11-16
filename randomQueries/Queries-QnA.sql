-- 1- Show first name and last name of patients that weigh within the range of 100 to 120 (inclusive).

   SELECT 
    first_name, last_name
FROM
    patients
WHERE
    weight BETWEEN 100 AND 120;



-- 2. Show the city, company_name, contact_name of all customers from cities that contain the letter 'L' in the city name, sorted by contact_name

   SELECT 
    city, company_name, contact_name
FROM
    customers
WHERE
    city LIKE '%L%'
ORDER BY contact_name ASC;


-- 3. Show the first_name, last_name, and height of the patient with the greatest height.

   SELECT 
    MAX(height) AS height, first_name, last_name
FROM
    patients;


-- 4. Show all columns for patients with one of the following patient_ids:<br> 1,45,534,879,1000.

   SELECT 
    *
FROM
    patients
WHERE
    patient_id IN (1 , 45, 534, 879, 1000);


-- 5. Show the patient_id and the total number of admissions for patient_id 579 with the count column having the alias total_admissions

   SELECT 
    patient_id, COUNT(patient_id) AS total_admissions
FROM
    admissions
WHERE
    patient_id = 579;
   
   
-- 6. Retrieve US customers' names and countries, ordered by first name.

   SELECT 
    FirstName, Country
FROM
    Customer
WHERE
    Country = 'USA'
ORDER BY FirstName ASC;
   
-- 7. Fetch unique customer cities in alphabetical order

SELECT DISTINCT
    (City)
FROM
    Customer
ORDER BY City ASC; 


-- 8. Show all the columns from admissions where the patient was admitted and discharged on the same day.


   SELECT 
    *
FROM
    admissions
WHERE
    admission_date = discharge_date;  
   
   
-- 9. Show all the even numbered Order_id from the orders table

   SELECT 
    Order_id
FROM
    orders
WHERE
    MOD(Order_id, 2) = 0;
   
-- 10. Retrieve track names and album IDs for tracks over 5 minutes

  SELECT 
    AlbumId, Name
FROM
    Track
WHERE
    Milliseconds > 300000
ORDER BY Name ASC;
 
-- 11. Show the average unit price rounded to 2 decimal places, the total units in stock,
--     total discontinued products from the products table. The column names must be average_price, total_stock, total_discontinued

   SELECT 
    ROUND(AVG(unit_price), 2) AS average_price,
    SUM(units_in_stock) AS total_stock,
    SUM(discontinued) AS total_discontinued
FROM
    products;
  
-- 12. Show patient_id and first_name from patients where their first_name start
--     and ends with s and is at least 6 characters long and ordered by patient_id

    SELECT 
    patient_id, first_name
FROM
    patients
WHERE
    first_name LIKE 's%s'
        AND LENGTH(first_name) >= 6;
    
-- 13. display the number of duplicate patients based on their first_name and last_name.
--     Make sure the column names are first_name, last_name, num_of_duplicates

    SELECT 
    first_name,
    last_name,
    COUNT(first_name) AS num_of_duplicates
FROM
    patients
GROUP BY first_name , last_name
HAVING COUNT(first_name) > 1;
    
-- 14. Show patient_id, diagnosis from admissions. Find patients admitted more than 1 times for the same diagnosis.

   SELECT 
    patient_id, diagnosis
FROM
    admissions
GROUP BY patient_id , diagnosis
HAVING COUNT(*) > 1;    
   
-- 15. Show all columns for patient_id 542's most recent admission_date.

   SELECT *
FROM admissions
WHERE patient_id = 542
    AND admission_date = (
        SELECT MAX(admission_date)
        FROM admissions
        WHERE patient_id = 542
    );   