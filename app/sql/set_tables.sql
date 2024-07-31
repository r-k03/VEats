DROP TABLE RotationalDrink;
DROP TABLE RotationalItem;
DROP TABLE Drink;
DROP TABLE OrderContains;
DROP TABLE ItemMadeWith;
DROP TABLE MenuFeaturesItem;
DROP TABLE MenuItem;
DROP TABLE Menu;
DROP TABLE Orders;
DROP TABLE Restaurant;
DROP TABLE RestaurantCuisine;
DROP TABLE OwnsVehicle;
DROP TABLE Vehicle;
DROP TABLE DeliveryPerson;
DROP TABLE HasDietaryPreference;
DROP TABLE Customer;
DROP TABLE Ingredient;

CREATE TABLE Ingredient (
	IngredientName	VARCHAR(50) PRIMARY KEY,
	IngredientType	VARCHAR(50)
);	

CREATE TABLE Customer (
	CustomerID		VARCHAR(12) PRIMARY KEY,
	CustomerName	VARCHAR(50),
	CustomerAddress	VARCHAR(50) NOT NULL,
	CustomerPhoneNum	CHAR(12)
);

CREATE TABLE HasDietaryPreference (
	CustomerID		VARCHAR(10),
	IngredientName	VARCHAR(50),
	PreferenceType	VARCHAR(20),
    PRIMARY KEY	(CustomerID, IngredientName),
    FOREIGN KEY	(CustomerID) REFERENCES
        Customer(CustomerID)
        ON DELETE CASCADE,
        --ON UPDATE CASCADE,
    FOREIGN KEY (IngredientName) REFERENCES
        Ingredient(IngredientName)
        ON DELETE CASCADE
        --ON UPDATE CASCADE
);

CREATE TABLE DeliveryPerson (
	LicenseNum	 		CHAR(8) PRIMARY KEY,
	DeliveryPersonName		VARCHAR(50),
	DeliveryPersonRating 	FLOAT,
	PhoneNum			CHAR(12) UNIQUE
);

CREATE TABLE Vehicle (
	LicensePlateNum		VARCHAR(8) PRIMARY KEY,
	InsuranceExpiryDate	DATE,
	Brand				VARCHAR(20),
	VehicleModel		VARCHAR(20), 
	VehicleColour		VARCHAR(20)
);

CREATE TABLE OwnsVehicle (
	LicenseNum		CHAR(8),
	LicensePlateNum	VARCHAR(8),
	PRIMARY KEY	(LicenseNum, LicensePlateNum),
	FOREIGN KEY (LicenseNum) REFERENCES
		DeliveryPerson(LicenseNum),
	FOREIGN KEY	(LicensePlateNum) REFERENCES
		Vehicle(LicensePlateNum)
);

CREATE TABLE RestaurantCuisine (
	RestaurantName		    VARCHAR(50) PRIMARY KEY,
	RestaurantCuisineType	VARCHAR(20)
);

CREATE TABLE Restaurant (
	RestaurantAddress	VARCHAR(50) PRIMARY KEY,
	RestaurantName	    VARCHAR(50) ,
	RestaurantRating	FLOAT,
	RestaurantPhoneNum	CHAR(10) UNIQUE,
    FOREIGN KEY (RestaurantName) REFERENCES 
        RestaurantCuisine(RestaurantName) 
        ON DELETE CASCADE
        --ON UPDATE CASCADE
);

CREATE TABLE Orders (
	OrderID 		VARCHAR(10) PRIMARY KEY,
	OrderDate		DATE,
	CustomerID		VARCHAR(10),	
	LicenseNum 		CHAR(8),
	RestaurantAddress	VARCHAR(50),
	FOREIGN KEY	(CustomerID) REFERENCES
		Customer(CustomerID)
        ON DELETE SET NULL,
        --ON UPDATE CASCADE,
    FOREIGN KEY 	(LicenseNum) REFERENCES
        DeliveryPerson(LicenseNum)
        ON DELETE SET NULL,
        --ON UPDATE CASCADE,
    FOREIGN KEY 	(RestaurantAddress) REFERENCES 
        Restaurant(RestaurantAddress)
        ON DELETE SET NULL
        --ON UPDATE CASCADE
);

CREATE TABLE Menu (
	MenuName		    VARCHAR(20),
	RestaurantAddress	VARCHAR(50),
	MealType	    	VARCHAR(20),
	PRIMARY KEY	(MenuName, RestaurantAddress),
    FOREIGN KEY	(RestaurantAddress) REFERENCES 
        Restaurant(RestaurantAddress)
        ON DELETE CASCADE
        --ON UPDATE CASCADE
);

CREATE TABLE MenuItem	(
	MenuItemName	VARCHAR(50) PRIMARY KEY,
	Calories		INT
);

CREATE TABLE MenuFeaturesItem (
    MenuItemName	    VARCHAR(50),
	MenuName		    VARCHAR(20),
    RestaurantAddress	VARCHAR(50),
	ItemPrice		FLOAT NOT NULL,
    PRIMARY KEY	(MenuItemName, MenuName),
    FOREIGN KEY	(MenuItemName) REFERENCES
            MenuItem(MenuItemName),
    FOREIGN KEY	(MenuName, RestaurantAddress) REFERENCES Menu(MenuName, RestaurantAddress)
        ON DELETE CASCADE
        --ON UPDATE CASCADE
);
	
CREATE TABLE ItemMadeWith (
	MenuItemName	VARCHAR(50),
	IngredientName	VARCHAR(50),
	PRIMARY KEY 	(MenuItemName, IngredientName),
	FOREIGN KEY	(MenuItemName) REFERENCES
		MenuItem(MenuItemName),
	FOREIGN KEY	(IngredientName) REFERENCES
		Ingredient(IngredientName)
);

CREATE TABLE OrderContains (
	OrderID		    VARCHAR(10),
	MenuItemName	VARCHAR(50),
	PRIMARY KEY 	(OrderID, MenuItemName),
	FOREIGN KEY	(MenuItemName) REFERENCES
		MenuItem(MenuItemName),
    FOREIGN KEY	(OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        --ON UPDATE CASCADE
);

CREATE TABLE Drink (
    MenuItemName	VARCHAR(50) PRIMARY KEY,
    Volume		    INT,
    AlcoholContent	FLOAT,
    FOREIGN KEY	(MenuItemName) REFERENCES
        MenuItem(MenuItemName)
);

CREATE TABLE RotationalItem(
    MenuItemName	VARCHAR(50) PRIMARY KEY,
    StartDate 		DATE NOT NULL,
    EndDate 		DATE NOT NULL,
    FOREIGN KEY	(MenuItemName) REFERENCES
        MenuItem(MenuItemName)
);

CREATE TABLE RotationalDrink(
	MenuItemName	VARCHAR(50) PRIMARY KEY,
	StartDate 		DATE NOT NULL,
	EndDate 		DATE NOT NULL,
	Volume  		INT,
	AlcoholContent	FLOAT,
    FOREIGN KEY	(MenuItemName) REFERENCES
        MenuItem(MenuItemName)
);




