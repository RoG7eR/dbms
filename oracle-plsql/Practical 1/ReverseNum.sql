SET SERVEROUTPUT ON;

DECLARE
  num1 NUMBER := 12345;
  reversed_num NUMBER := 0;
BEGIN 
    WHILE num1 > 0 LOOP
        reversed_num := reversed_num * 10 + MOD(num1, 10);
        num1 := FLOOR(num1 / 10);
    END LOOP;
    
    dbms_output.put_line('Reversed Number: ' || reversed_num); 
END;
