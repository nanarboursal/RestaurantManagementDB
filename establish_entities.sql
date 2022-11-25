CREATE TABLE EMPLOYEE(
    Employee_ID char(5) not null,
    First_Name varchar(30) not null,
    Last_Name varchar(40) not null,
    Role varchar(20) not null,
    SSN char(9) not null,
    Address varchar(50) not null,
    Cell_Phone_Number char(13) not null,
    Email varchar(20) not null,
    PRIMARY KEY(Employee_ID),
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
    CONSTRAINT employee_fk FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE INGREDIENT(
    Dish_ID char(5) not null,
    Item_ID char(5) not null,
    PRIMARY KEY(Dish_ID, Item_ID),
    CONSTRAINT dish_fk FOREIGN KEY(Dish_ID) REFERENCES MENU(Dish_ID),
    CONSTRAINT item_fk FOREIGN KEY(Item_ID) REFERENCES INVENTORY(Item_ID)
);

CREATE TABLE CHECK(
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
    CONSTRAINT employee_fk FOREIGN KEY(Server_Employee_ID) REFERENCES EMPLOYEE(Employee_ID),
    CONSTRAINT reservation_fk FOREIGN KEY(Reservation_ID) REFERENCES RESERVATION(Reservation_ID),
    CONSTRAINT table_no_fk FOREIGN KEY(Table_Number) REFERENCES LAYOUT(Table_Number),
    CONSTRAINT credit_card_fk FOREIGN KEY(Credit_Card_ID) REFERENCES CREDIT_CARD(Credit_Card_ID)
);

CREATE TABLE ITEMIZED_RECEIPT(
    Check_ID char(5) not null,
    Dish_ID char(5) not null,
    Quantity int not null,
    PRIMARY KEY(Check_ID, Dish_ID),
    CONSTRAINT check_fk FOREIGN KEY(Check_ID) REFERENCES CHECK(Check_ID),
    CONSTRAINT dish_fk FOREIGN KEY(Dish_ID) REFERENCES MENU(Dish_ID)
);

insert into employee values("70301", "Nanar", "Boursalian", "Waitress", "123456789", "124 Washington Blvd, San Jose, CA 95123", "(415)444-5555", "nanar.boursalian@sjsu.edu");
insert into employee values("17502", "Seema", "Vora", "Hostess", "111222333", "199 Brooklyn St, San Jose, CA 95122", "(415)400-5111", "seema.vora@sjsu.edu");
insert into employee values("54424", "Surabhi", "Gupta", "Server", "4445556666", "600 Lisa Ave, San Jose, CA 95121", "(428)910-7121", "surabhi.gupta@sjsu.edu");
insert into employee values("22933", "Aaron", "Jones", "Chef", "888999777", "30 Jane Rd, San Jose, CA 95101", "(409)230-8895", "aaron.jones@sjsu.edu");

insert into menu values ("39755", "Chicken Parmesan", 15.95);
insert into menu values ("11518", "Vegetable Stir Fry", 14.90);
insert into menu values ("83738", "Broccoli Cheddar Soup", 12.10);
insert into menu values ("66593", "Spaghetti and Meatballs", 14.15);

insert into credit_card values("51188", "1222400087699546", "Cheryl Sherman", "03/01/2026", "Visa", "022");
insert into credit_card values("24271", "4446899355558123", "Jared Weiss", "04/01/2025", "MasterCard", "009");
insert into credit_card values("78171", "3333654789906557", "Elise Smith", "01/01/2027", "Discover", "768");
insert into credit_card values("20952", "2223335576598976", "Jane Jackson", "05/01/2026", "Amex", "999");

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

insert into reservation values("96822", 7, "Jerry Lee", "19:00:00", "11/23/2022");
insert into reservation values("08130", 3, "Harold Jones", "16:00:00", "11/23/2022");
insert into reservation values("64444", 2, "Spencer Dave", "20:00:00", "11/27/2022");
insert into reservation values("58999", 2, "Alden Shelley", "19:00:00", "11/20/2022");

insert into inventory values("37797", "Broccoli", "floret", 10.5, 19.5);
insert into inventory values("35608", "Chicken Breast", "piece", 40.0, 90.0);
insert into inventory values("48157", "Cheddar Cheese", "block", 6.0, 5.5);
insert into inventory values("19471", "Spaghetti Pasta", "packets", 32.0, 40.5);

insert into paycheck values("82167", "70301", 224.56, 60.70);
insert into paycheck values("46210", "17502", 337.90, 30.88);
insert into paycheck values("46316", "54424", 200.79, 65.35);
insert into paycheck values("97384", "22933", 380.60, 17.90);

insert into timecard values("31706", "70301", 24.88);
insert into timecard values("66319", "17502", 29.00);
insert into timecard values("40300", "54424", 21.23);
insert into timecard values("47318", "22933", 30.42);

insert into ingredient values("83738", "37797");
insert into ingredient values("39755", "35608");
insert into ingredient values("11518", "37797");
insert into ingredient values("66593", "19471");
insert into ingredient values("83738", "48157");

insert into check values("67136", "70301", null, 1, "51188", 78.95, 6.75, 14.55, 0.00, 100.25);
insert into check values("27848", "70301", "08130", 4, null, 35.60, 3.10, 12.40, 51.10, 0.00);
insert into check values("33947", "54424", "58999", 6, "24271", 99.87, 8.67, 20.30, 0.00, 128.84);
insert into check values("69474", "54424", null, 9, "20952", 57.89, 7.85, 13.36, 0.00, 79.10);

insert into itemized_receipt values("67136", "39755", 2);
insert into itemized_receipt values("27848" "83738", 4);
insert into itemized_receipt values("33947", "11518", 1);
insert into itemized_receipt values("33947", "19471", 2);
insert into itemized_receipt values("69474", "11518", 3);
