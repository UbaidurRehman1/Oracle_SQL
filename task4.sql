SET SERVEROUTPU ON;
DECLARE 
    emp_name "SYSTEM"."EMPLOYEES".FIRST_NAME%TYPE;
    emp_email "SYSTEM"."EMPLOYEES".email%TYPE;
    phone_number "SYSTEM"."EMPLOYEES".phone_number%TYPE;
    emp_date "SYSTEM"."EMPLOYEES".hire_date%TYPE;
    emp_salary "SYSTEM"."EMPLOYEES".salary%TYPE;
    emp_job "SYSTEM"."JOBS".job_title%TYPE;
    emp_department "SYSTEM"."DEPARTMENTS".department_name%TYPE;
    emp_country "SYSTEM"."COUNTRIES".COUNTRY_NAME%TYPE;
    emp_region "SYSTEM"."REGIONS".REGION_NAME%TYPE;
BEGIN
    for rec in (
    select 
        CONCAT(CONCAT(emp.first_name, ' '), emp.last_nmae) as name,
        emp.email as Email, 
        emp.phone_number as "phone_number",
        emp.hire_date as "HireDate", 
        emp.salary as Salary,
        jobs.job_title as "JOBType",
        dept.department_name as "Department",
        cont.country_name as "Country",
        reg.region_name as "Region"
--    into
--        emp_name, emp_email, emp_phone, emp_date, emp_salary, emp_job, emp_department, emp_country, emp_region
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
    FETCH FIRST 5 ROWS ONLY)
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name ||' '|| rec.Email ||'  '|| rec.phone_number ||' '|| rec.hire_date
        ||' '|| rec.salary ||' '|| rec.job_title ||' 
        '|| rec.department_name || ' ' || rec.country_name || ' ' || rec.region_name);
    END LOOP;
END;
/


--display employees detail along with the 5 highest paid employees
--select 
--    CONCAT(CONCAT(emp.first_name, ' '), emp.last_nmae) as name,
--    emp.email as Email, 
--    emp.phone_number as "Phone Number",
--    emp.hire_date as "Hire Date", 
--    emp.salary as Salary,
--    jobs.job_title as "JOB Type",
--    dept.department_name as "Department",
--    cont.country_name as "Country",
--    reg.region_name as "Region"
--from
--    "SYSTEM"."EMPLOYEES" emp
--        inner join
--    "SYSTEM"."JOBS" jobs on emp.job_id = jobs.job_id
--        inner join 
--    "SYSTEM"."DEPARTMENTS" dept on emp.department_id = dept.department_id
--        inner join
--    "SYSTEM"."LOCATIONS" loc on dept.location_id = loc.location_id
--        inner join
--    "SYSTEM"."COUNTRIES" cont on loc.country_id = cont.country_id 
--        inner join
--    "SYSTEM"."REGIONS" reg on cont.region_id = reg.region_id
--order by emp.salary desc
--FETCH FIRST 5 ROWS ONLY;
