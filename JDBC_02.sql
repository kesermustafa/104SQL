
CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;
SELECT * FROM companies;

select company, number_of_employees from companies order by number_of_employees desc offset 1 limit 1;

-- 2. YOL 
SELECT company, number_of_employees
FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--
SELECT company, number_of_employees
FROM companies
WHERE number_of_employees = (SELECT MAX(number_of_employees)
                            FROM companies
                            WHERE number_of_employees < (SELECT MAX(number_of_employees)
                                                         FROM companies));
														 
														 
--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından 
     -- az olan number_of_employees değerlerini 16000 olarak UPDATE edin.		

UPDATE companies SET number_of_employees = 16000
WHERE number_of_employees < (select avg (number_of_employees) from companies);




	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
														 