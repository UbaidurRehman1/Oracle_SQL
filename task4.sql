--display employees detail along with the 5 highest paid employees
select 
    CONCAT(CONCAT(emp.first_name, ' '), emp.last_nmae) as name,
    emp.email as Email, 
    emp.phone_number as "Phone Number",
    emp.hire_date as "Hire Date", 
    emp.salary as Salary,
    jobs.job_title as "JOB Type",
    dept.department_name as "Department",
    cont.country_name as "Country",
    reg.region_name as "Region"
from
    "SYSTEM"."EMPLOYEES" emp
        inner join
    "SYSTEM"."JOBS" jobs on emp.job_id = jobs.job_id
        inner join 
    "SYSTEM"."DEPARTMENTS" dept on emp.department_id = dept.department_id
        inner join
    "SYSTEM"."LOCATIONS" loc on dept.location_id = loc.location_id
        inner join
    "SYSTEM"."COUNTRIES" cont on loc.country_id = cont.country_id 
        inner join
    "SYSTEM"."REGIONS" reg on cont.region_id = reg.region_id
order by emp.salary desc
FETCH FIRST 5 ROWS ONLY;