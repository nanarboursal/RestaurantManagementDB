-- BASIC

-- Find the tables that are available that can seat more than 5.
select Table_Number, No_of_Seats from layout where No_of_Seats > 5 and Availability=TRUE;
-- Find the items that are running low and the amounts needed to be purchased from inventory.
select Item_Name, Item_Needed_Quantity-Item_Current_Quantity as Purchase_Amount, Unit from inventory where Item_Needed_Quantity>Item_Current_Quantity;

-- INTERMEDIATE
-- Find how many hours each employee works ordered by descending amount of hours.
select k.First_Name, k.Last_Name, k.Hours from ((select * from employee left join timecard using(Employee_ID)) union (select * from employee right join timecard using(Employee_ID))) as k order by k.Hours;
-- Find how much each employee gets paid ordered by descending amount of pay, including tips.
select k.First_Name, k.Last_Name, k.Amount_Paid+k.Tips as Total_Salary from ((select * from employee left join paycheck using(Employee_ID)) union (select * from employee right join paycheck using(Employee_ID))) as k order by Total_Salary;

-- ADVANCED
-- Find

-- Find
