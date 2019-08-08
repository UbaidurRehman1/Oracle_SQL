INSERT INTO STAR_EMPLOYEES(employee_id, hire_year, location_id, country_id, region_id)
select emp.EMPLOYEE_ID, emp.HIRE_DATE, loc.LOCATION_ID, cont.country_id, cont.region_id
FROM "SYSTEM"."EMPLOYEES" emp 
INNER JOIN "SYSTEM"."DEPARTMENTS" dept on emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
INNER JOIN "SYSTEM"."LOCATIONS" loc on dept.DEPARTMENT_ID = loc.LOCATION_ID
INNER JOIN "SYSTEM"."COUNTRIES" cont on loc.country_id = cont.country_id;


--select * from STAR_EMPLOYEES;