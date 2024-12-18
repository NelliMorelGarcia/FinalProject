-- Create the database
CREATE DATABASE restaurant_reservations;

-- Use the created database
USE restaurant_reservations;


-- Create Customers Table
CREATE TABLE Customers (
    customerId INT NOT NULL AUTO_INCREMENT UNIQUE,
    customerName VARCHAR(45) NOT NULL,
    contactInfo VARCHAR(200),
    PRIMARY KEY (customerId)
);

-- Create Reservations Table
CREATE TABLE Reservations (
    reservationId INT NOT NULL AUTO_INCREMENT UNIQUE,
    customerId INT NOT NULL,
    reservationTime DATETIME NOT NULL,
    numberOfGuests INT NOT NULL,
    specialRequests VARCHAR(200),
    PRIMARY KEY (reservationId),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

-- Create DiningPreferences Table
CREATE TABLE DiningPreferences (
    preferenceId INT NOT NULL AUTO_INCREMENT UNIQUE,
    customerId INT NOT NULL,
    favoriteTable VARCHAR(45),
    dietaryRestrictions VARCHAR(200),
    PRIMARY KEY (preferenceId),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);


DELIMITER $$

CREATE PROCEDURE findReservations(IN inputCustomerId INT)
BEGIN
    SELECT 
        R.reservationId,
        R.reservationTime,
        R.numberOfGuests,
        R.specialRequests
    FROM 
        Reservations R
    WHERE 
        R.customerId = inputCustomerId;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE addSpecialRequest(
    IN inputReservationId INT,
    IN inputRequests VARCHAR(200)
)
BEGIN
    UPDATE Reservations
    SET specialRequests = inputRequests
    WHERE reservationId = inputReservationId;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE addReservation(
    IN inputCustomerName VARCHAR(45),
    IN inputContactInfo VARCHAR(200),
    IN reservationTime DATETIME,
    IN numberOfGuests INT,
    IN specialRequests VARCHAR(200)
)
BEGIN
    DECLARE customerId INT;

    -- Check if the customer already exists
    SELECT customerId INTO customerId
    FROM Customers
    WHERE customerName = inputCustomerName AND contactInfo = inputContactInfo;

    -- If no customer is found, insert a new one
    IF customerId IS NULL THEN
        INSERT INTO Customers (customerName, contactInfo)
        VALUES (inputCustomerName, inputContactInfo);
        SET customerId = LAST_INSERT_ID();
    END IF;

    -- Add the reservation for the customer
    INSERT INTO Reservations (customerId, reservationTime, numberOfGuests, specialRequests)
    VALUES (customerId, reservationTime, numberOfGuests, specialRequests);
END $$

DELIMITER ;

INSERT INTO Customers (customerName, contactInfo)
VALUES 
    ('Nelli Morel', 'NelliMorel@example.com'),
    ('Cesar Morel', 'CesarMorel@example.com'),
    ('Ramona Garcia', '+1234567890');
    
    INSERT INTO Reservations (customerId, reservationTime, numberOfGuests, specialRequests)
VALUES 
    (1, '2024-12-15 19:30:00', 4, 'Birthday celebration'),
    (2, '2024-12-16 20:00:00', 2, 'Window seat'),
    (3, '2024-12-17 18:00:00', 3, 'Allergic to peanuts');

INSERT INTO DiningPreferences (customerId, favoriteTable, dietaryRestrictions)
VALUES 
    (1, 'Table 5', 'Vegan'),
    (2, 'Table 10', 'Gluten-free'),
    (3, 'Table 3', 'No peanuts');
