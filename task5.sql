--on department number, total salary of the department

--First funcation which return the total salary of the dept--
CREATE OR REPLACE FUNCTION findTotalSalaryOfDept(dept_id IN int)
RETURN int IS
    total_sal int := 0;
BEGIN
	SELECT
		 sum(emp.salary) 
	INTO
		total_sal
	FROM
		"SYSTEM"."EMPLOYEES" emp 
	GROUP BY
		 emp.department_id
	HAVING
		emp.department_id = dept_id;
        
    RETURN
        total_sal;
END;
/

--another funcation which call the total salary function--
CREATE OR REPLACE FUNCTION wrapper1
RETURN int IS 
    total int := 0;
BEGIN
    total := findTotalSalaryOfDept(1);
    RETURN total;
END;
/

--calling wrapper for printing--
select wrapper1 from DUAL;
