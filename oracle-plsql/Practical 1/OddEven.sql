SET SERVEROUTPUT ON;
DECLARE
  message varchar2(100):= 'Hello, World!';
  num1 NUMBER := 10;
  num2 NUMBER := 15; 
BEGIN 
  IF num1 MOD 2 = 0 THEN
    dbms_output.put_line(num1 || ' is Even');
  ELSE
    dbms_output.put_line(num1 || ' is Odd');
  END IF; 
END;
