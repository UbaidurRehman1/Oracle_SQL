CREATE OR REPLACE TRIGGER task6trigger
    AFTER UPDATE OF FIRST_NAME ON "SYSTEM"."EMPLOYEES"
    FOR EACH ROW
BEGIN
    dbms_output.put('Old First Name: ' || :old.FIRST_NAME);
    dbms_output.put('New First Name: ' || :new.FIRST_NAME);
END;
/

--UPDATE "SYSTEM"."EMPLOYEES" emp
--SET emp.FIRST_NAME = 'Khalid'
--WHERE emp.employee_id = 1;