use HR_DB;
select * from Employees;
select * from Employees where CountryID = 2;
select * from Employees where DepartmentID = 12;
select * from Employees where MonthlySalary > 5000;
select * from Employees where HireDate > '2020-12-31';
select * from Employees where ExitDate is not null;
select * from Employees where BonusPerc > 10;
