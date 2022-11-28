-- BASIC

-- Find all items on menu which are have a price that is NOT IN between $8-$10
SELECT Dish_ID, Dish_Name FROM menu WHERE Price NOT IN (10,8);

-- Find all employees who have worked below 5 hours
SELECT * FROM timecard WHERE Hours < 5;

-- INTERMEDIATE

-- Find all inventory items which have current quantity > 35 and needed quantity < 10.
-- Assumption: resturant wants to keep atleast 35 items per ingredient and when needed quantity < 10, then no need to restock
select Item_ID, Item_NAME  from ((select * from INVENTORY where Item_Current_Quantity >35) union (select * from INVENTORY where Item_Needed_Quantity <10)) as k;

-- Find all customers who have a Visa card and expiration before 2025-07-05
select Card_Number, Card_Name from ((select * from CREDIT_CARD where Card_Name = "Visa") union (select * from CREDIT_CARD where Expiration_Date<'2025-07-05')) as k;

-- ADVANCED

-- Find all employee listed on check and retrieving their timecard and paycheck details
select * from CHECKDETAILS join TIMECARD on CHECKDETAILS.Server_Employee_ID  = TIMECARD.Employee_ID  join PAYCHECK on PAYCHECK.Employee_ID  = TIMECARD.Employee_ID;

-- Find all details on item listed on menu and the itemized receipt, and retreiving ingredient details
select * from INGREDIENT join ITEMIZED_RECEIPT on INGREDIENT.Dish_ID  = ITEMIZED_RECEIPT.Dish_ID  join MENU on MENU.Dish_ID  = INGREDIENT.Dish_ID;
