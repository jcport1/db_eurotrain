/* 
CS5200
Jeff Cuartas Final Project
*/

CREATE DATABASE eurotrainline;  
USE eurotrainline;  

-- passengerid is the unique code of the passenger
-- passenger_firstname is the first name of the passenger
-- passenger_lastname is the last name of the passenger
CREATE TABLE passenger( passengerId INTEGER NOT NULL,  
passenger_firstname CHAR(50) NOT NULL,  
passenger_lastname CHAR(50) NOT NULL,
passenger_email CHAR(50) NOT NULL,
PRIMARY KEY (passengerId));

-- routeid is the unique code of the route
-- depart_location is the departure location of the route
-- arrive_location is the arrival location of the route
CREATE TABLE route( routeId INTEGER,  
depart_location CHAR(50),  
arrive_location CHAR(50),
fare DECIMAL(5,2) NOT NULL,
PRIMARY KEY (routeId));

-- conductorid is the unique code of the conductor
-- conductor_name is the name of the conductorid
CREATE TABLE conductor( conductorId INTEGER NOT NULL,  
conductor_firstname CHAR(50) NOT NULL,
conductor_lastname CHAR(50) NOT NULL,
PRIMARY KEY (conductorId));

-- reservation table
CREATE TABLE reservation
(
  reservationId INTEGER NOT NULL,
  passengerId INTEGER NOT NULL,
  PRIMARY KEY (reservationId),
  FOREIGN KEY (passengerId) REFERENCES passenger(passengerId)
);    

-- trainid is the unique code of the id
-- train_brand is the brand of train
-- train_model is the model of train
-- conductorid is the id of the train
CREATE TABLE train( trainId INTEGER NOT NULL,  
train_manufacturer ENUM ('Alstom', 'Siemens', 'Bombardier', 'Hitachi Rail') NOT NULL,
train_type ENUM ('High Speed', 'Inter-city', 'Commuter') NOT NULL,
conductorId INTEGER NOT NULL,
PRIMARY KEY (trainId), 
FOREIGN KEY (conductorId) REFERENCES conductor(conductorId));  

-- scheduleId is the unique id of the schedule
-- depart_time is the departure time of the schedule: '00:00:00'
-- arrive_time is the departure time of the schedule: '00:00:00'
-- routeid is the route id of the schedule
-- trainid is the train id of the schedule
CREATE TABLE schedule( scheduleId INTEGER NOT NULL,  
depart_time TIME NOT NULL,  
arrive_time TIME NOT NULL,
routeId INTEGER NOT NULL,
trainId INTEGER NOT NULL,
PRIMARY KEY (scheduleId),
FOREIGN KEY (trainId) REFERENCES train(trainId),
FOREIGN KEY (routeId) REFERENCES route(routeId));

-- customerid is the unique id of the customer
-- customer_name is the name of the customer
-- customer_zip is the zip of the customer
CREATE TABLE customer( customerId INTEGER NOT NULL,
customer_firstname CHAR(30) NOT NULL,
customer_lastname CHAR(30) NOT NULL,
customer_zip CHAR(5) NOT NULL,
PRIMARY KEY (customerId));

-- transactionid is the unique id of the transaction
-- customerid is the customer id of the transaction
-- transactiondate is the date of the transactions 'YYYY-MM-DD'
CREATE TABLE salesTransaction( transactionId INTEGER NOT NULL,
customerId INTEGER NOT NULL,
transactionDate DATE NOT NULL,
PRIMARY KEY (transactionId),
FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

-- timeTable
-- date format: 'YYYY-MM-DD'
CREATE TABLE timeTable
(
  timeTableId INTEGER NOT NULL,
  travelDate DATE NOT NULL,
  scheduleId INTEGER NOT NULL,
  PRIMARY KEY (timeTableId),
  FOREIGN KEY (scheduleId) REFERENCES schedule(scheduleId)
);

-- ticketid is the unique id of the ticket
-- timetableid is the timetable id of the ticket
-- passengerid is the passenger id of the ticket
-- ticketdate is the date of the ticket
-- transactionid is the transaction id of the ticket
CREATE TABLE ticket( ticketId INTEGER NOT NULL,
transactionId INTEGER NOT NULL,
timeTableId INTEGER NOT NULL,
reservationId INTEGER NOT NULL,
PRIMARY KEY (ticketId),
FOREIGN KEY (transactionId) REFERENCES salesTransaction(transactionId),
FOREIGN KEY (timeTableId) REFERENCES timeTable(timeTableId),
FOREIGN KEY (reservationId) REFERENCES reservation(reservationId)
);