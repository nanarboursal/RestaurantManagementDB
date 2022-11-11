CREATE TABLE MENU (
    Dish_ID char(5) not null,
    Dish_Name varchar(30) not null,
    Price decimal(10, 2) not null,
    PRIMARY KEY(Dish_ID)
);

CREATE TABLE INVENTORY(
    Item_ID char(5) not null, 
    Item_Name varchar(30) not null,
    Unit varchar(10) not null,
    Item_Current_Quantity decimal(10, 2) not null,
    Item_Needed_Quantity decimal(10, 2) not null,
    PRIMARY KEY(Item_ID)
);

CREATE TABLE INGREDIENT(
    Dish_ID char(5) not null,
    Item_ID char(5) not null,
    PRIMARY KEY(Dish_ID, Item_ID),
    CONSTRAINT dish_fk FOREIGN KEY(Dish_ID) REFERENCES MENU(Dish_ID),
    CONSTRAINT item_fk FOREIGN KEY(Item_ID) REFERENCES INVENTORY(Item_ID)
);

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

CREATE TABLE TIMECARD(
    Timecard_ID char(5) not null,
    Employee_ID char(5) not null,
    Hours decimal(10, 2) not null,
    PRIMARY KEY(Timecard_ID),
    CONSTRAINT employee_fk FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE PAYCHECK(
    Paycheck_ID char(5) not null,
    Employee_ID char(5) not null,
    Amount_Paid decimal(10, 2) not null,
    Tips decimal(10, 2) not null,
    PRIMARY KEY(Paycheck_ID),
    CONSTRAINT employee_fk FOREIGN KEY(Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
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

CREATE TABLE RESERVATION(
    Reservation_ID char(5) not null,
    Name varchar(50) not null,
    No_in_Party int not null,
    Reserve_Time time not null,
    PRIMARY KEY(Reservation_ID)
);

CREATE TABLE LAYOUT(
    Table_Number int not null,
    No_of_Seats int not null,
    Availability boolean not null,
    PRIMARY KEY(Table_Number)
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
    PRIMARY KEY(Check_ID, Dish_ID),
    CONSTRAINT check_fk FOREIGN KEY(Check_ID) REFERENCES CHECK(Check_ID),
    CONSTRAINT dish_fk FOREIGN KEY(Dish_ID) REFERENCES MENU(Dish_ID)
);