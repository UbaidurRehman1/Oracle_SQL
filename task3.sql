--select 
--    CONCAT(CONCAT(emp.first_name, ' '), emp.last_nmae) as name,
--    emp.email as Email, 
--    emp.phone_number as "Phone Number",
--    emp.hire_date as "Hire Date", 
--    emp.salary as Salary,
--    jobs.job_title as "JOB Type",
--    dept.department_name as "Department"
--from
--    "SYSTEM"."EMPLOYEES" emp
--        inner join
--    "SYSTEM"."JOBS" jobs on emp.job_id = jobs.job_id
--        inner join 
--    "SYSTEM"."DEPARTMENTS" dept on emp.department_id = dept.department_id
--    
--where employee_id = 5;

SET SERVEROUTPU ON;

DECLARE 
    emp_name "SYSTEM"."EMPLOYEES".FIRST_NAME%TYPE;
    emp_email "SYSTEM"."EMPLOYEES".email%TYPE;
    emp_phone "SYSTEM"."EMPLOYEES".phone_number%TYPE;
    emp_date "SYSTEM"."EMPLOYEES".hire_date%TYPE;
    emp_salary "SYSTEM"."EMPLOYEES".salary%TYPE;
    emp_job "SYSTEM"."JOBS".job_title%TYPE;
    emp_department "SYSTEM"."DEPARTMENTS".department_name%TYPE;
BEGIN
    select 
        CONCAT(CONCAT(emp.first_name, ' '), emp.last_nmae) as name,
        emp.email as Email, 
        emp.phone_number as "Phone Number",
        emp.hire_date as "Hire Date", 
        emp.salary as Salary,
        jobs.job_title as "JOB Type",
        dept.department_name as "Department"
    into
        emp_name, emp_email, emp_phone, emp_date, emp_salary, emp_job, emp_department
    from
        "SYSTEM"."EMPLOYEES" emp
            inner join
        "SYSTEM"."JOBS" jobs on emp.job_id = jobs.job_id
            inner join 
        "SYSTEM"."DEPARTMENTS" dept on emp.department_id = dept.department_id
    
    where
        employee_id = 5;
        
    DBMS_OUTPUT.PUT_LINE(emp_name ||' '|| emp_email ||'  '|| emp_phone ||' '|| emp_date
        ||' '|| emp_salary ||' '|| emp_job ||' '|| emp_department);
END;
/
    
    
    