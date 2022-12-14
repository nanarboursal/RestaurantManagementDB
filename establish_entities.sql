CREATE TABLE EMPLOYEE(
    Employee_ID char(5) not null,
    First_Name varchar(30) not null,
    Last_Name varchar(40) not null,
    Role varchar(20) not null,
    SSN char(9) not null,
    Address varchar(50) not null,
    Cell_Phone_Number char(13) not null,
    Email varchar(20) not null,
    PRIMARY KEY(Employee_ID)
);

CREATE TABLE MENU (
    Dish_ID char(5) not null,
    Dish_Name varchar(30) not null,
    Price decimal(10, 2) not null,
    PRIMARY KEY(Dish_ID)
);

CREATE TABLE CREDIT_CARD(
    Credit_Card_ID char(5) not null,
    Card_Number char(16) not null,
    Card_Name varchar(50) not null,
    Expiration_Date date not null,
    Card_Type varchar(15) not null,
    Security_Code varchar(4) not null,
    PRIMARY KEY(Credit_Card_ID)
);

CREATE TABLE LAYOUT(
    Table_Number int not null,
    No_of_Seats int not null,
    Availability boolean not null,
    PRIMARY KEY(Table_Number)
);

CREATE TABLE RESERVATION(
    Reservation_ID char(5) not null,
    Name varchar(50) not null,
    No_in_Party int not null,
    Reserve_Time time not null,
    Reserve_Date date not null,
    PRIMARY KEY(Reservation_ID)
);

CREATE TABLE INVENTORY(
    Item_ID char(5) not null, 
    Item_Name varchar(30) not null,
    Unit varchar(10) not null,
    Item_Current_Quantity decimal(10, 2) not null,
    Item_Needed_Quantity decimal(10, 2) not null,
    PRIMARY KEY(Item_ID)
);

CREATE TABLE PAYCHECK(
    Paycheck_ID char(5) not null,
    Employee_ID char(5) not null,
    Amount_Paid decimal(10, 2) not null,
    Tips decimal(10, 2) not null,
    PRIMARY KEY(Paycheck_ID),
    CONSTRAINT employee_fk FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE TIMECARD(
    Timecard_ID char(5) not null,
    Employee_ID char(5) not null,
    Hours decimal(10, 2) not null,
    PRIMARY KEY(Timecard_ID),
    CONSTRAINT employee_timecard_fk FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE INGREDIENT(
    Dish_ID char(5) not null,
    Item_ID char(5) not null,
    PRIMARY KEY(Dish_ID, Item_ID),
    CONSTRAINT dish_ingredient_fk FOREIGN KEY(Dish_ID) REFERENCES MENU(Dish_ID),
    CONSTRAINT item_ingredient_fk FOREIGN KEY(Item_ID) REFERENCES INVENTORY(Item_ID)
);

CREATE TABLE CHECKDETAILS(
    Check_ID char(5) not null,
    Server_Employee_ID char(5) not null,
    Reservation_ID char(5),
    Table_Number int not null,
    Credit_Card_ID char(5),
    Total decimal(10, 2) not null,
    Tax decimal(10, 2) not null,
    Tip decimal(10, 2) not null,
    Cash_Amount_Paid decimal(10, 2),
    Credit_Amount_Paid decimal(10, 2),
    PRIMARY KEY(Check_ID),
    CONSTRAINT employee_check_fk FOREIGN KEY(Server_Employee_ID) REFERENCES EMPLOYEE(Employee_ID),
    CONSTRAINT reservation_check_fk FOREIGN KEY(Reservation_ID) REFERENCES RESERVATION(Reservation_ID),
    CONSTRAINT table_no_check_fk FOREIGN KEY(Table_Number) REFERENCES LAYOUT(Table_Number),
    CONSTRAINT credit_card_check_fk FOREIGN KEY(Credit_Card_ID) REFERENCES CREDIT_CARD(Credit_Card_ID)
);

CREATE TABLE ITEMIZED_RECEIPT(
    Check_ID char(5) not null,
    Dish_ID char(5) not null,
    Quantity int not null,
    PRIMARY KEY(Check_ID, Dish_ID),
    CONSTRAINT check_receipt_fk FOREIGN KEY(Check_ID) REFERENCES CHECKDETAILS(Check_ID),
    CONSTRAINT dish_receipt_fk FOREIGN KEY(Dish_ID) REFERENCES MENU(Dish_ID)
);

insert into employee values("70301", "Nanar", "Boursalian", "Waitress", "123456789", "124 Washington Blvd, San Jose, CA 95123", "(415)444-5555", "nanar.b@sjsu.edu");
insert into employee values("17502", "Seema", "Vora", "Hostess", "111222333", "199 Brooklyn St, San Jose, CA 95122", "(415)400-5111", "seema.vora@sjsu.edu");
insert into employee values("54424", "Surabhi", "Gupta", "Server", "44455566", "600 Lisa Ave, San Jose, CA 95121", "(428)910-7121", "surabhi.g@sjsu.edu");
insert into employee values("22933", "Aaron", "Jones", "Chef", "888999777", "30 Jane Rd, San Jose, CA 95101", "(409)230-8895", "aaron.jones@sjsu.edu");
insert into employee values("56735", "John", "Smith", "Sous-Chef", "930472304", "341 Fremont Rd, San Jose, CA 95201", "(449)130-8675", "john.smith@sjsu.edu");
insert into employee values("12353", "Sarah", "Singh", "Server", "485729456", "994 Pleasonton Blvd, Pleasanton, CA 94536", "(749)993-2295", "sarah.singh@sjsu.edu");
insert into employee values("78123", "Rohan", "Singh", "Waiter", "905723456", "123 Starlight Blvd, San Francisco, CA 94136", "(415)193-2295", "rohan.singh@sjsu.edu");
insert into employee values("10293", "Shelly", "Rov", "Chef", "235729956", "1118 Simple Blvd, San Francisco, CA 94136", "(415)193-2210", "shelly.rov@sjsu.edu");

insert into menu values ("39755", "Chicken Parmesan", 15.95);
insert into menu values ("11518", "Vegetable Stir Fry", 14.90);
insert into menu values ("83738", "Broccoli Cheddar Soup", 12.10);
insert into menu values ("66593", "Spaghetti and Meatballs", 14.15);
insert into menu values ("64642", "Garlic Bread", 2.15);
insert into menu values ("88646", "Tomato Soup", 11.25);
insert into menu values ("77352", "Orange Juice", 4.25);
insert into menu values ("89357", "Pad See Ew", 14.25);
insert into menu values ("10358", "Cheese Pizza", 24.75);

insert into credit_card values("51188", "1222400087699546", "Cheryl Sherman", "2026-03-01", "Visa", "022");
insert into credit_card values("24271", "4446899355558123", "Jared Weiss", "2025-04-01", "MasterCard", "009");
insert into credit_card values("78171", "3333654789906557", "Elise Smith", "2027-01-01", "Discover", "768");
insert into credit_card values("20952", "2223335576598976", "Jane Jackson", "2026-05-01", "Amex", "999");
insert into credit_card values("12345", "2288735576598976", "Mary Kerry", "2023-05-01", "Visa", "223");
insert into credit_card values("23474", "1111735576598976", "Ron Potter", "2025-07-01", "Visa", "213");
insert into credit_card values("12346", "9982335512398944", "Harry Sora", "2027-09-01", "Discover", "122");
insert into credit_card values("24412", "1111555512398916", "Meg Solder", "2025-08-01", "Amex", "891");

insert into layout values(1, 6, TRUE);
insert into layout values(2, 4, FALSE);
insert into layout values(3, 2, TRUE);
insert into layout values(4, 10, TRUE);
insert into layout values(5, 8, TRUE);
insert into layout values(6, 6, FALSE);
insert into layout values(7, 2, TRUE);
insert into layout values(8, 8, TRUE);
insert into layout values(9, 4, TRUE);
insert into layout values(10, 2, TRUE);
insert into layout values(11, 2, FALSE);
insert into layout values(12, 8, TRUE);
insert into layout values(13, 1, FALSE);
insert into layout values(14, 3, TRUE);
insert into layout values(15, 2, FALSE);
insert into layout values(16, 8, TRUE);

insert into reservation values("96822", "Jerry Lee", 7, "19:00:00", "2022-11-23");
insert into reservation values("08130", "Harold Jones", 3,"16:00:00", "2022-11-23");
insert into reservation values("64444",  "Spencer Dave",2, "20:00:00", "2022-11-27");
insert into reservation values("58999",  "Alden Shelley", 2,"19:00:00", "2020-11-20");
insert into reservation values("66464",  "Oscar Wood", 4,"20:00:00", "2020-11-21");
insert into reservation values("92646",  "Hazel Timothy", 6,"18:00:00", "2020-11-19");
insert into reservation values("12111",  "Harry Edwards", 2,"20:00:00", "2020-11-21");
insert into reservation values("55511",  "Rusty Mac", 4,"20:00:00", "2020-11-20");
insert into reservation values("12311",  "Josh Hetchers", 5,"18:00:00", "2020-11-18");

insert into inventory values("37797", "Broccoli", "floret", 10.5, 19.5);
insert into inventory values("35608", "Chicken Breast", "piece", 40.0, 90.0);
insert into inventory values("48157", "Cheddar Cheese", "block", 6.0, 5.5);
insert into inventory values("19471", "Spaghetti Pasta", "packets", 32.0, 40.5);
insert into inventory values("57243", "Organic Bread", "packets", 38.0, 9.5);
insert into inventory values("32325", "Tomatoes", "packets", 40.5, 2.55);
insert into inventory values("63536", "Organic Oranges", "packets", 44.5, 8.55);
insert into inventory values("55123", "Boiled Egg", "packets", 10.0, 12.5);
insert into inventory values("11125", "Brussel Sprouts", "packets", 20.5, 10.55);
insert into inventory values("12336", "Organic Apple", "packets", 24.5, 9.55);

insert into paycheck values("82167", "70301", 224.56, 60.70);
insert into paycheck values("46210", "17502", 337.90, 30.88);
insert into paycheck values("46316", "54424", 200.79, 65.35);
insert into paycheck values("97384", "22933", 380.60, 17.90);
insert into paycheck values("77575", "56735", 344.60, 10.90);
insert into paycheck values("77175", "54424", 300.60, 14.90);
insert into paycheck values("12575", "17502", 342.10, 11.90);
insert into paycheck values("11175", "54424", 300.20, 12.90);

insert into timecard values("31706", "70301", 24.88);
insert into timecard values("66319", "17502", 29.00);
insert into timecard values("40300", "54424", 21.23);
insert into timecard values("47318", "22933", 30.42);
insert into timecard values("11234", "56735", 12.42);
insert into timecard values("94634", "12353", 35.78);

insert into ingredient values("83738", "37797");
insert into ingredient values("39755", "35608");
insert into ingredient values("11518", "37797");
insert into ingredient values("66593", "19471");
insert into ingredient values("88646", "32325");
insert into ingredient values("77352", "48157");
insert into ingredient values("64642", "57243");
insert into ingredient values("64642", "32325");
insert into ingredient values("77352", "32325");
insert into ingredient values("64642", "19471");

insert into checkdetails values("67136", "70301", null, 1, "51188", 78.95, 6.75, 14.55, 0.00, 100.25);
insert into checkdetails values("27848", "70301", "08130", 4, null, 35.60, 3.10, 12.40, 51.10, 0.00);
insert into checkdetails values("33947", "54424", "58999", 6, "24271", 99.87, 8.67, 20.30, 0.00, 128.84);
insert into checkdetails values("69474", "54424", null, 9, "20952", 57.89, 7.85, 13.36, 0.00, 79.10);
insert into checkdetails values("55353", "12353", null, 9, "12345", 35.89, 9.85, 13.36, 0.00, 79.10);

insert into itemized_receipt values("67136", "39755", 2);
insert into itemized_receipt values("27848", "83738", 4);
insert into itemized_receipt values("33947", "11518", 1);
insert into itemized_receipt values("33947", "66593", 2);
insert into itemized_receipt values("69474", "11518", 3);
insert into itemized_receipt values("55353", "77352", 2);
