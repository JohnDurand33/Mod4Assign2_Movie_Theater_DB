-- Customer
CREATE TABLE Customer (
customer_id SERIAL,
first_name VARCHAR(100),
last_name VARCHAR(100),
email_address VARCHAR(100),
phone_number CHAR(15),
address VARCHAR(150),
PRIMARY KEY (customer_id)
);

-- TheaterRooms
CREATE TABLE TheaterRooms (
room_id SERIAL,
max_occupancy INT,
exit_door_num INT,
open_status BOOLEAN,
PRIMARY KEY (room_id)
);

-- Vendors
CREATE TABLE Vendors (
vendor_id SERIAL,
vendor_name VARCHAR(150),
contact_number CHAR(15),
address VARCHAR(150),
PRIMARY KEY (vendor_id)
);

-- VendorProducts
CREATE TABLE VendorProducts (
v_product_id SERIAL,
v_product_name VARCHAR(200),
vendor_id INT NOT NULL,
PRIMARY KEY (v_product_id),
FOREIGN KEY (vendor_id) REFERENCES Vendors (vendor_id)
);

-- Movies
CREATE TABLE Movies (
movie_id SERIAL,
title VARCHAR(200),
start_date DATE,
end_date DATE,
customer_id INT NOT NULL,
PRIMARY KEY (movie_id),
FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);

-- ConcessionItems
CREATE TABLE ConcessionItems (
item_id SERIAL,
item_name VARCHAR(100),
price FLOAT,
description VARCHAR(500),
v_product_id INT NOT NULL,
PRIMARY KEY (item_id),
FOREIGN KEY (v_product_id) REFERENCES VendorProducts (v_product_id)
);

-- Transactions  (for total amount, you would need to have another program identify if the sale was a concession or a ticket sale and populate the correct amount, and instead of having a field for concession_trans_id AND ticket_trans_id, you would only have one.  Populated both here but would only have one in real world application.)
CREATE TABLE Transactions (
transaction_id SERIAL,
trans_type VARCHAR(20),
total_trans_amount FLOAT not NULL,
transaction_date TIMESTAMP WITHOUT TIME ZONE,
customer_id INT NOT NULL,
tix_trans_id INT,
conc_trans_id INT,
PRIMARY KEY (transaction_id),
FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),
FOREIGN KEY (tix_trans_id) REFERENCES TicketSales (tix_trans_id),
FOREIGN KEY (conc_trans_id) REFERENCES Concessions (conc_trans_id)
);

-- Ticket
CREATE TABLE Ticket (
ticket_id SERIAL,
ticket_type VARCHAR(20),
price FLOAT,
PRIMARY KEY (ticket_id)
);

-- Concessions
CREATE TABLE Concessions (
conc_trans_id SERIAL,
total_conc_trans_amt FLOAT,
transaction_date TIMESTAMP WITHOUT TIME ZONE,
customer_id INT NOT NULL,
PRIMARY KEY (conc_trans_id),
FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);

-- TicketSales
CREATE TABLE TicketSales (
tix_trans_id SERIAL,
customer_id INT NOT NULL,
total_tix_trans_amt FLOAT,
transaction_date TIMESTAMP WITHOUT TIME ZONE,
PRIMARY KEY (tix_trans_id),
FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);

-- TicketSalesDetails
CREATE TABLE TicketSalesDetails (
tix_trans_id INT NOT NULL,
ticket_type VARCHAR(20),
quantity_sold INT,
PRIMARY KEY (tix_trans_id, ticket_type),
FOREIGN KEY (tix_trans_id) REFERENCES TicketSales (tix_trans_id)
);

-- ConcessionsDetails
CREATE TABLE ConcessionsDetails (
conc_trans_id INT NOT NULL,
item_id INT,
quantity INT,
PRIMARY KEY (conc_trans_id, item_id),
FOREIGN KEY (conc_trans_id) REFERENCES Concessions (conc_trans_id),
FOREIGN KEY (item_id) REFERENCES ConcessionItems (item_id)
);

-- MovieShowings
CREATE TABLE MovieShowings (
showtime TIMESTAMP WITHOUT TIME ZONE,
movie_id INT NOT NULL,
room_id INT NOT NULL,
ticket_id INT NOT NULL,
PRIMARY KEY (showtime, movie_id, room_id),
FOREIGN KEY (movie_id) REFERENCES Movies (movie_id),
FOREIGN KEY (room_id) REFERENCES TheaterRooms (room_id),
FOREIGN KEY (ticket_id) REFERENCES Ticket (ticket_id)
);