-- Insert statements for Customer table
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('1', 'Esther Murty', '1234 Granville Street', '6041322523');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('2', 'Melvin Cottis', '5678 Burrard Street', '7782334961');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('3', 'Raff Aspinell', '4321 Main Street', '6046328177');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('4', 'Sadye Tutsell', '8765 Cambie Street', '6049912784');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('5', 'Jonah Essberger', '9101 Oak Street', '6043770667');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('6', 'Terese Musselwhite', '3456 West 4th Avenue', '7788288315');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('7', 'Nanice Spinola', '7890 Kingsway', '6042141623');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('8', 'Janey Bernucci', '6543 Commercial Drive', '7784885825');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('9', 'Karee Garter', '3210 Fraser Street', '7782635321');
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerPhoneNum) VALUES ('10', 'Gillan Heinzler', '9876 Broadway', '6046998676');

-- Insert statements for DeliveryPerson table
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('81685719', 'Hildagarde Scothorne', 0.78, '6042200356');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('01983055', 'Whitman Goburn', 0.60, '7787043887');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('78276122', 'Kayley Massey', 0.86, '6046217985');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('85681253', 'Sky McElhargy', 0.83, '7782797384');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('29795860', 'Tansy Jakeman', 0.65, '6049161407');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('09571867', 'Germayne Shillabeer', 0.74, '7782260243');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('99220121', 'Merwin Bartley', 0.86, '6049770612');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('69154261', 'Perrine Griffitt', 0.92, '7785478319');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('83174286', 'Ciel Bahl', 0.94, '6041300961');
INSERT INTO DeliveryPerson (LicenseNum, DeliveryPersonName, DeliveryPersonRating, PhoneNum) VALUES ('72761716', 'Teddie Townsend', 0.73, '7784343030');

-- Insert statements for Vehicle table
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('LAD201', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 'Toyota', 'Camry', 'Blue');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('A42LO2', TO_DATE('2024-11-30', 'YYYY-MM-DD'), 'Honda', 'Civic', 'Red');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('K6G2F5', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'Ford', 'Escape', 'Silver');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('FGB343', TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Chevrolet', 'Malibu', 'Black');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('H3BL35', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'Nissan', 'Altima', 'White');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('423JKW', TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Hyundai', 'Elantra', 'Gray');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('B9D23L', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Volkswagen', 'Jetta', 'Green');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('DD541E', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Subaru', 'Outback', 'Brown');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('LE441A', TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'Mazda', 'CX-5', 'Orange');
INSERT INTO Vehicle (LicensePlateNum, InsuranceExpiryDate, Brand, VehicleModel, VehicleColour) VALUES ('SIGMA', TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'Tesla', 'Model 3', 'White');

-- Insert statements for OwnsVehicle table
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('81685719', 'LAD201');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('01983055', 'A42LO2');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('78276122', 'K6G2F5');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('85681253', 'FGB343');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('29795860', 'H3BL35');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('09571867', '423JKW');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('99220121', 'B9D23L');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('69154261', 'DD541E');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('83174286', 'LE441A');
INSERT INTO OwnsVehicle (LicenseNum, LicensePlateNum) VALUES ('72761716', 'SIGMA');

-- Insert statements for RestaurantCuisine table
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Tasty Bites', 'Indian');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Spice Haven', 'Thai');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Sushi Delight', 'Japanese');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Pizza Paradise', 'Italian');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Burger Joint', 'American');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Mexican Fiesta', 'Mexican');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Café Bliss', 'French');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Thai Orchid', 'Thai');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Greek Taverna', 'Greek');
INSERT INTO RestaurantCuisine (RestaurantName, RestaurantCuisineType) VALUES ('Indian Spice', 'Indian');

-- Insert statements for Restaurant table
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('123 Main St', 'Tasty Bites', 4.5, '5551234');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('456 Elm Ave', 'Spice Haven', 4.2, '5555678');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('789 Oak Rd', 'Sushi Delight', 4.8, '5559876');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('101 Maple Ln', 'Pizza Paradise', 4.0, '5554321');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('222 Cherry Blvd', 'Burger Joint', 3.7, '5552468');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('333 Pine Dr', 'Mexican Fiesta', 4.3, '5551357');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('444 Walnut Ct', 'Café Bliss', 4.6, '5556789');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('555 Cedar Ave', 'Thai Orchid', 4.4, '5557890');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('666 Birch St', 'Greek Taverna', 4.1, '5555432');
INSERT INTO Restaurant (RestaurantAddress, RestaurantName, RestaurantRating, RestaurantPhoneNum) VALUES ('777 Willow Rd', 'Indian Spice', 4.7, '5558765');

-- Insert statements for Orders table
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('1', TO_DATE('2024-07-15', 'YYYY-MM-DD'), '8', '81685719', '123 Main St');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('2', TO_DATE('2024-07-16', 'YYYY-MM-DD'), '4', '01983055', '456 Elm Ave');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('3', TO_DATE('2024-07-17', 'YYYY-MM-DD'), '7', '78276122', '789 Oak Rd');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('4', TO_DATE('2024-07-18', 'YYYY-MM-DD'), '5', '85681253', '101 Maple Ln');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('5', TO_DATE('2024-07-19', 'YYYY-MM-DD'), '6', '29795860', '222 Cherry Blvd');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('6', TO_DATE('2024-07-20', 'YYYY-MM-DD'), '9', '09571867', '333 Pine Dr');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('7', TO_DATE('2024-07-21', 'YYYY-MM-DD'), '1', '99220121', '444 Walnut Ct');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('8', TO_DATE('2024-07-22', 'YYYY-MM-DD'), '6', '69154261', '555 Cedar Ave');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('9', TO_DATE('2024-07-23', 'YYYY-MM-DD'), '1', '83174286', '666 Birch St');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('10', TO_DATE('2024-07-24', 'YYYY-MM-DD'), '4', '72761716', '777 Willow Rd');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('11', TO_DATE('2024-07-25', 'YYYY-MM-DD'), '9', '81685719', '123 Main St');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('12', TO_DATE('2024-07-26', 'YYYY-MM-DD'), '6', '01983055', '456 Elm Ave');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('13', TO_DATE('2024-07-27', 'YYYY-MM-DD'), '9', '78276122', '789 Oak Rd');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('14', TO_DATE('2024-07-28', 'YYYY-MM-DD'), '7', '85681253', '101 Maple Ln');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('15', TO_DATE('2024-07-29', 'YYYY-MM-DD'), '8', '29795860', '222 Cherry Blvd');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('16', TO_DATE('2024-07-30', 'YYYY-MM-DD'), '2', '09571867', '333 Pine Dr');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('17', TO_DATE('2024-07-31', 'YYYY-MM-DD'), '7', '99220121', '444 Walnut Ct');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('18', TO_DATE('2024-08-01', 'YYYY-MM-DD'), '9', '69154261', '555 Cedar Ave');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('19', TO_DATE('2024-08-02', 'YYYY-MM-DD'), '8', '83174286', '666 Birch St');
INSERT INTO Orders (OrderID, OrderDate, CustomerID, LicenseNum, RestaurantAddress) VALUES ('20', TO_DATE('2024-08-03', 'YYYY-MM-DD'), '2', '72761716', '777 Willow Rd');


-- Insert statements for MenuItem table
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Cheeseburger', 550);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Grilled Chicken Salad', 350);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Veggie Wrap', 300);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Spaghetti Bolognese', 600);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Margherita Pizza', 700);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Sushi Roll', 250);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Pad Thai', 650);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Tacos', 500);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('French Fries', 400);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Caesar Salad', 350);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Breakfast Burrito', 450);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Pancakes', 500);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Chocolate Cake', 600);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Apple Pie', 450);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Chicken Curry', 550);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Beef Steak', 700);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Fish and Chips', 650);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Vegetable Stir Fry', 400);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Lentil Soup', 200);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Chicken Quesadilla', 600);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Avocado Toast', 300);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('BLT Sandwich', 450);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Pepperoni Pizza', 750);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Fettuccine Alfredo', 800);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Shrimp Tacos', 450);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Clam Chowder', 300);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('BBQ Ribs', 900);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Garden Salad', 200);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Eggplant Parmesan', 600);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Turkey Sandwich', 400);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Beer', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Red Wine', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('White Wine', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Whiskey', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Cocktail', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Vodka', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Gin', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Rum', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Champagne', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Liqueur', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Cola', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Diet Cola', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Lemonade', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Orange Juice', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Espresso', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Latte', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Cappuccino', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Summer BBQ Cheeseburger Extravaganza', 400);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Fall Harvest Grilled Chicken Salad', 122);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Autumn Spaghetti Bolognese Delight', 200);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Halloween Margherita Pizza Special', 400);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Thanksgiving Sushi Roll Medley', 150);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Summer Breeze Mojito', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Autumn Spiced Apple Cider', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Halloween Pumpkin Ale', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Thanksgiving Cranberry Punch', 0);
INSERT INTO MenuItem (MenuItemName, Calories) VALUES ('Holiday Eggnog Delight', 0);

-- Insert statements for MenuFeaturesItem table
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Cheeseburger', 'Burgers', 8.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Grilled Chicken Salad', 'Lunch Specials', 10.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Veggie Wrap', 'Lunch Specials', 7.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Spaghetti Bolognese', 'Dinner Feasts', 12.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Margherita Pizza', 'Dinner Feasts', 11.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Sushi Roll', 'Lunch Specials', 8.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Pad Thai', 'Thai Dinner', 11.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Tacos', 'Fiesta Lunch', 9.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('French Fries', 'Burgers', 3.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Caesar Salad', 'Lunch Combos', 6.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Breakfast Burrito', 'Breakfast Specials', 5.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Pancakes', 'Breakfast Specials', 7.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Chocolate Cake', 'Desserts', 6.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Apple Pie', 'Desserts', 5.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Chicken Curry', 'Dinner Feasts', 11.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Beef Steak', 'Dinner Feasts', 14.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Fish and Chips', 'Lunch Combos', 10.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Vegetable Stir Fry', 'Lunch Combos', 8.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Lentil Soup', 'Lunch Combos', 6.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Chicken Quesadilla', 'Lunch Combos', 9.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Avocado Toast', 'Breakfast Specials', 6.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('BLT Sandwich', 'Lunch Combos', 7.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Pepperoni Pizza', 'Dinner Deals', 12.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Fettuccine Alfredo', 'Dinner Feasts', 13.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Shrimp Tacos', 'Fiesta Dinners', 11.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Clam Chowder', 'Lunch Combos', 7.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('BBQ Ribs', 'Dinner Feasts', 15.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Garden Salad', 'Lunch Combos', 5.99);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Eggplant Parmesan', 'Dinner Feasts', 12.49);
INSERT INTO MenuFeaturesItem (MenuItemName, MenuName, ItemPrice) VALUES ('Turkey Sandwich', 'Lunch Combos', 8.49);

-- Insert statements for Drink table
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Beer', 355, 0.05);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Red Wine', 150, 0.125);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('White Wine', 150, 0.11);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Whiskey', 50, 0.40);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Cocktail', 200, 0.15);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Vodka', 50, 0.40);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Gin', 50, 0.375);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Rum', 50, 0.35);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Champagne', 150, 0.12);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Liqueur', 50, 0.25);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Cola', 355, 0.0);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Diet Cola', 355, 0.0);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Lemonade', 355, 0.0);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Orange Juice', 355, 0.0);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Espresso', 60, 0.0);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Latte', 240, 0.0);
INSERT INTO Drink (MenuItemName, Volume, AlcoholContent) VALUES ('Cappuccino', 240, 0.0);

-- Insert statements for RotationalItem table
INSERT INTO RotationalItem (MenuItemName, StartDate, EndDate) VALUES ('Summer BBQ Cheeseburger Extravaganza', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-31', 'YYYY-MM-DD'));
INSERT INTO RotationalItem (MenuItemName, StartDate, EndDate) VALUES ('Fall Harvest Grilled Chicken Salad', TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'));
INSERT INTO RotationalItem (MenuItemName, StartDate, EndDate) VALUES ('Autumn Spaghetti Bolognese Delight', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'));
INSERT INTO RotationalItem (MenuItemName, StartDate, EndDate) VALUES ('Halloween Margherita Pizza Special', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-31', 'YYYY-MM-DD'));
INSERT INTO RotationalItem (MenuItemName, StartDate, EndDate) VALUES ('Thanksgiving Sushi Roll Medley', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'));

-- Insert statements for RotationalDrink table
INSERT INTO RotationalDrink (MenuItemName, StartDate, EndDate, Volume, AlcoholContent) VALUES ('Summer Breeze Mojito', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-31', 'YYYY-MM-DD'), 300, 0.08);
INSERT INTO RotationalDrink (MenuItemName, StartDate, EndDate, Volume, AlcoholContent) VALUES ('Autumn Spiced Apple Cider', TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'), 250, 0.05);
INSERT INTO RotationalDrink (MenuItemName, StartDate, EndDate, Volume, AlcoholContent) VALUES ('Halloween Pumpkin Ale', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), 330, 0.06);
INSERT INTO RotationalDrink (MenuItemName, StartDate, EndDate, Volume, AlcoholContent) VALUES ('Thanksgiving Cranberry Punch', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-31', 'YYYY-MM-DD'), 200, 0.04);
INSERT INTO RotationalDrink (MenuItemName, StartDate, EndDate, Volume, AlcoholContent) VALUES ('Holiday Eggnog Delight', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'), 250, 0.12);

-- Insert statements for OrderContains table
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('1', 'Cheeseburger');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('1', 'French Fries');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('2', 'Grilled Chicken Salad');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('2', 'Vegetable Stir Fry');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('3', 'Margherita Pizza');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('3', 'Pancakes');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('4', 'Chicken Curry');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('4', 'Fish and Chips');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('5', 'Shrimp Tacos');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('5', 'Garden Salad');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('6', 'BBQ Ribs');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('6', 'Fettuccine Alfredo');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('7', 'Breakfast Burrito');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('7', 'Avocado Toast');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('8', 'Pad Thai');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('9', 'BLT Sandwich');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('9', 'Pepperoni Pizza');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('10', 'Chicken Curry');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('10', 'Fish and Chips');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('11', 'Cheeseburger');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('11', 'French Fries');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('12', 'Grilled Chicken Salad');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('12', 'Vegetable Stir Fry');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('13', 'Chocolate Cake');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('13', 'Apple Pie');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('14', 'Margherita Pizza');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('14', 'Pancakes');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('15', 'Shrimp Tacos');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('15', 'Garden Salad');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('16', 'Clam Chowder');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('16', 'Eggplant Parmesan');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('17', 'Beef Steak');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('17', 'Lentil Soup');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('18', 'Chicken Quesadilla');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('18', 'Spaghetti Bolognese');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('19', 'BBQ Ribs');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('19', 'Fettuccine Alfredo');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('20', 'Turkey Sandwich');
INSERT INTO OrderContains (OrderID, MenuItemName) VALUES ('20', 'Cheeseburger');

-- Insert statements for Ingredient table
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Ground Beef', 'Meat');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Cheddar Cheese', 'Dairy');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Onions', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Potatoes', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Olive Oil', 'Oil');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Chicken Breast', 'Meat');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Bell Peppers', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Broccoli', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Tofu', 'Soy Product');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Tomatoes', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Garlic', 'Spice');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Rice', 'Grain');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Nori', 'Seaweed');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Peanuts', 'Nut');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Lettuce', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Parmesan Cheese', 'Dairy');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Eggs', 'Dairy');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Flour Tortilla', 'Grain');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Flour', 'Grain');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Milk', 'Dairy');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Sugar', 'Sweetener');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Butter', 'Dairy');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Apples', 'Fruit');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Coconut Milk', 'Dairy Substitute');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Salt', 'Seasoning');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Black Pepper', 'Spice');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Salmon', 'Fish');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Cream', 'Dairy');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Cabbage', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Clams', 'Seafood');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Pork Ribs', 'Meat');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('BBQ Sauce', 'Sauce');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Cucumber', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Eggplant', 'Vegetable');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Marinara Sauce', 'Sauce');
INSERT INTO Ingredient (IngredientName, IngredientType) VALUES ('Turkey Breast', 'Meat');

-- Insert statements for ItemMadeWith table
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Cheeseburger', 'Ground Beef');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Cheeseburger', 'Cheddar Cheese');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Cheeseburger', 'Onions');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('French Fries', 'Potatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('French Fries', 'Olive Oil');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Grilled Chicken Salad', 'Chicken Breast');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Grilled Chicken Salad', 'Bell Peppers');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Grilled Chicken Salad', 'Broccoli');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Veggie Wrap', 'Tofu');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Veggie Wrap', 'Bell Peppers');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Veggie Wrap', 'Tomatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Spaghetti Bolognese', 'Ground Beef');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Spaghetti Bolognese', 'Tomatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Spaghetti Bolognese', 'Garlic');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Margherita Pizza', 'Cheddar Cheese');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Margherita Pizza', 'Tomatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Margherita Pizza', 'Olive Oil');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Sushi Roll', 'Salmon');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Sushi Roll', 'Rice');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Sushi Roll', 'Nori');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Pad Thai', 'Rice');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Pad Thai', 'Tofu');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Pad Thai', 'Peanuts');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Tacos', 'Ground Beef');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Tacos', 'Bell Peppers');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Tacos', 'Onions');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Caesar Salad', 'Chicken Breast');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Caesar Salad', 'Lettuce');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Caesar Salad', 'Parmesan Cheese');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Breakfast Burrito', 'Eggs');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Breakfast Burrito', 'Cheddar Cheese');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Breakfast Burrito', 'Flour Tortilla');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Pancakes', 'Flour');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Pancakes', 'Eggs');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Pancakes', 'Milk');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chocolate Cake', 'Flour');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chocolate Cake', 'Sugar');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chocolate Cake', 'Butter');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Apple Pie', 'Apples');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Apple Pie', 'Flour');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Apple Pie', 'Sugar');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chicken Curry', 'Chicken Breast');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chicken Curry', 'Garlic');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chicken Curry', 'Coconut Milk');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Beef Steak', 'Ground Beef');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Beef Steak', 'Salt');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Beef Steak', 'Black Pepper');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Fish and Chips', 'Salmon');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Fish and Chips', 'Flour');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Fish and Chips', 'Potatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Vegetable Stir Fry', 'Broccoli');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Vegetable Stir Fry', 'Bell Peppers');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Vegetable Stir Fry', 'Garlic');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chicken Quesadilla', 'Chicken Breast');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chicken Quesadilla', 'Cheddar Cheese');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Chicken Quesadilla', 'Flour Tortilla');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Clam Chowder', 'Clams');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Clam Chowder', 'Cream');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Clam Chowder', 'Potatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('BBQ Ribs', 'Pork Ribs');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('BBQ Ribs', 'BBQ Sauce');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('BBQ Ribs', 'Garlic');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Garden Salad', 'Lettuce');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Garden Salad', 'Tomatoes');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Garden Salad', 'Cucumber');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Eggplant Parmesan', 'Eggplant');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Eggplant Parmesan', 'Marinara Sauce');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Eggplant Parmesan', 'Parmesan Cheese');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Turkey Sandwich', 'Turkey Breast');
INSERT INTO ItemMadeWith (MenuItemName, IngredientName) VALUES ('Turkey Sandwich', 'Lettuce');

-- Insert statements for HasDietaryPreference table
INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType) VALUES ('2', 'Peanuts', 'Allergy');
INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType) VALUES ('2', 'Mushrooms', 'Allergy');
INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType) VALUES ('5', 'Salmon', 'Allergy');
INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType) VALUES ('6', 'Clams', 'Allergy');
INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType) VALUES ('6', 'Butter', 'Allergy');
INSERT INTO HasDietaryPreference (CustomerID, IngredientName, PreferenceType) VALUES ('7', 'Chicken Breast', 'Allergy');

-- Insert statements for Menu tables
INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Breakfast Specials', '123 Main St', 'Breakfast');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Lunch Combos', '123 Main St', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Dinner Feasts', '123 Main St', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Spicy Platters', '456 Elm Ave', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Evening Delight', '456 Elm Ave', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Lunch Specials', '789 Oak Rd', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Dinner Deals', '789 Oak Rd', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('2 for $10', '101 Maple Ln', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Desserts', '101 Maple Ln', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Burgers', '222 Cherry Blvd', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Milkshakes', '222 Cherry Blvd', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Fiesta Lunch', '333 Pine Dr', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Fiesta Dinners', '333 Pine Dr', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Breakfast Specials', '444 Walnut Ct', 'Breakfast');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Lunch Specials', '444 Walnut Ct', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Dinner Specials', '444 Walnut Ct', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Lunch Combos', '555 Cedar Ave', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Thai Dinner', '555 Cedar Ave', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Greek Lunch', '666 Birch St', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Happy Hour', '666 Birch St', 'Dinner');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Lunch Specials', '777 Willow Rd', 'Lunch');

INSERT INTO Menu (MenuName, RestaurantAddress, MealType)
VALUES ('Dinner Feasts', '777 Willow Rd', 'Dinner');

COMMIT;