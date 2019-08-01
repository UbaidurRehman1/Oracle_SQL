select 
    CONCAT(CONCAT(emp.first_name, ' '), emp.last_nmae) as name,
    emp.email as Email, 
    emp.phone_number as "Phone Number",
    emp.hire_date as "Hire Date", 
    emp.salary as Salary,
    jobs.job_title as "JOB Type",
    dept.department_name as "Department"
from
    "SYSTEM"."EMPLOYEES" emp
        inner join
    "SYSTEM"."JOBS" jobs on emp.job_id = jobs.job_id
        inner join 
    "SYSTEM"."DEPARTMENTS" dept on emp.department_id = dept.department_id
    
where employee_id = 5;