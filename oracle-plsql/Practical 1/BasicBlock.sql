SET SERVEROUTPUT ON;
DECLARE
  v_student_name varchar2(10):= 'Rohan'; 
BEGIN 
  dbms_output.put_line(v_student_name); 
END;
