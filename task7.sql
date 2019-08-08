--CREATE SEQUENCE dept_seq START WITH 1;
create table star_employees
(
    id int DEFAULT dept_seq.nextval primary key,
    employee_id int,
    hire_year date,
    location_id int,
    region_id int,
    country_id int
);
