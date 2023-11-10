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

