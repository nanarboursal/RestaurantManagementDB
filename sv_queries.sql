-- BASIC

-- Find all items on in paycheck where tip is greater than 20 dollars
Select * from Paycheck WHERE tips > 20;


-- Find all reservations that are after November 11,2022.
Select Reservation_ID from Reservation where Reserve_Date > 2022-11-21;

-- INTERMEDIATE

-- Find all ingredients where the current item quantity is less than the current quantity in the inventory. 
select *  from ((select Item_ID from INGREDIENT) union (select Item_ID from INVENTORY where Item_Current_Quantity < Item_Needed_Quantity)) as k;

-- Find all employees who have been paid more than 100 dollars and received a tip greater than 40 dollars. 
select Employee_ID from ((select * from Paycheck where Amount_Paid > 100) union (select * from Paycheck where Tips>40)) as k;

-- ADVANCED

-- Find paycheck and checkdetails information on all entries made by an employee.
select * from Paycheck join Employee on Paycheck.employee_id  = employee.employee_id join CHECKDETAILS on PAYCHECK.Employee_ID  = checkdetails.Server_Employee_ID;

-- Find order of credit cards expiring and total paid on the credit card to date. 
select Credit_Amount_Paid as Credit_Paid from ((select * from creditcard left join checkdetails using(Credit_Card_ID)) union (select * from creditcard right join checkdetails using(Credit_Card_ID))) as k order by Expiration_Date;