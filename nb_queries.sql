-- BASIC
-- Find the tables that are available that can seat more than 5.
select Table_Number, No_of_Seats from layout where No_of_Seats > 5 and Availability=TRUE;
-- Find the items that are running low and the amounts needed to be purchased from inventory.
select Item_Name from inventory where Item_Needed_Quantity>Item_Current_Quantity;

-- INTERMEDIATE
-- Find the employees who have served more than 1 table and worked more than 30 hours.
select e.First_Name, e.Last_Name from employee as e where e.Employee_ID in ((select Server_Employee_ID from checkdetails group by Server_Employee_ID having count(*)>1) union (select Employee_ID from timecard where Hours>30.0));

-- Find all staff with an SF area code phone and staff with server roles.
select Employee_ID, First_Name, Last_Name, Cell_Phone_Number, Role from ((select * from employee where Cell_Phone_Number like "(415)________") union (select * from employee where Role="Server")) as g;


-- ADVANCED
-- Find how many hours each employee works ordered by descending amount of hours.
select k.First_Name, k.Last_Name, k.Hours from ((select Employee_ID, First_Name, Last_Name, Hours from employee left join timecard using(Employee_ID)) union (select Employee_ID, First_Name, Last_Name, Hours from employee right join timecard using(Employee_ID))) as k order by k.Hours;
-- Find how much each employee gets paid ordered by descending amount of pay, including tips.
select k.First_Name, k.Last_Name, k.Amount_Paid+k.Tips as Total_Salary from ((select Employee_ID, First_Name, Last_Name, Amount_Paid, Tips from employee left join paycheck using(Employee_ID)) union (select Employee_ID, First_Name, Last_Name, Amount_Paid, Tips from employee right join paycheck using(Employee_ID))) as k order by Total_Salary;