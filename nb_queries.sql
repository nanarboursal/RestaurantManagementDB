select Table_Number, No_of_Seats from layout where No_of_Seats > 5 and Availability=TRUE;
select Item_Name, Item_Needed_Quantity-Item_Current_Quantity as Purchase_Amount, Unit from inventory where Item_Needed_Quantity>Item_Current_Quantity;

