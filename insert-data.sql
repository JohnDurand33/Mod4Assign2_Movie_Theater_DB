-- Customer
INSERT INTO Customer (first_name, last_name, email_address, phone_number, address)
VALUES ('John', 'Durand', 'john.durand@example.com', '555-123-4567', '6677 S Forest Way, Codingland, Colorado 80100');

INSERT INTO TheaterRooms (max_occupancy, exit_door_num, open_status)
VALUES (100, 2, TRUE), (200, 4, TRUE), (200, 4, TRUE), (100, 2, FALSE);

INSERT INTO Vendors (vendor_name, contact_number, address)
VALUES ('CodeDrink', '555-987-6543', '1234 Beverage Ave, Codingland, Colorado 80101'),
       ('CodeFood', '555-555-5555', '5678 Snacks St, Codingland, Colorado 80102');
       
INSERT INTO VendorProducts (v_product_name, vendor_id)
VALUES ('Large Drink', 1), ('Regular Drink', 1), ('Large Popcorn', 2), ('Skittles', 2), ('Nestle Crunch Bar', 2), ('Snowcaps', 2);

INSERT INTO Movies (title, start_date, end_date, customer_id)
VALUES ('Coding with Creatures of the Night', '2023-10-01', '2023-11-05', 1), ('Ken & Barbie 2: Ken codes behind Barbie''s Back', '2023-09-15', '2023-11-14', 1);

INSERT INTO ConcessionItems (item_name, price, description, v_product_id)
VALUES ('Large Drink', 4.00, 'Large soft drink', 1), 
	   ('Regular Drink', 3.50, 'Regular soft drink', 2), 
	   ('Large Popcorn', 5.00, 'Large bucket of popcorn', 3),
       ('Skittles', 4.00, 'A bag of Skittles', 4),
       ('Nestle Crunch Bar', 3.50, 'Nestle Crunch chocolate bar', 5),
       ('Snowcaps', 4.00, 'Box of Snowcaps', 6);
      
INSERT INTO MovieShowings (showtime, movie_id, room_id)
VALUES ('2023-10-30 11:30:00', 3, 1), ('2023-10-30 14:00:00', 3, 1),
       ('2023-10-30 17:30:00', 3, 1), ('2023-10-30 21:00:00', 3, 1),
       ('2023-10-30 13:30:00', 3, 2), ('2023-10-30 16:00:00', 3, 2),
       ('2023-10-30 19:30:00', 3, 2), ('2023-10-30 22:30:00', 3, 2),
       ('2023-10-30 12:00:00', 2, 3), ('2023-10-30 14:30:00', 2, 3),
       ('2023-10-30 18:00:00', 2, 3), ('2023-10-30 21:30:00', 2, 3),
       ('2023-10-30 11:45:00', 2, 4), ('2023-10-30 14:15:00', 2, 4),
       ('2023-10-30 16:45:00', 2, 4), ('2023-10-30 19:30:00', 2, 4);
      
INSERT INTO Ticket (ticket_type, price)
VALUES ('Child', 7.99), ('Adult', 12.99), ('Senior', 9.99);

INSERT INTO Concessions (total_conc_trans_amt, transaction_date, customer_id)
VALUES (38.50, '2023-10-30 19:45:00', 1);

INSERT INTO TicketSales (customer_id, total_tix_trans_amt, transaction_date)
VALUES (1, 94.95, '2023-10-30 19:30:00');

INSERT INTO TicketSalesDetails (tix_trans_id, ticket_type, quantity_sold)
VALUES (1, 'Child', 2), (1, 'Adult', 2), (1, 'Senior', 1);

INSERT INTO ConcessionsDetails (conc_trans_id, item_id, quantity)
VALUES (1, 1, 3), (1, 2, 2), (1, 3, 2), (1, 4, 1), (1, 5, 1), (1, 6, 2);

INSERT INTO Transactions (trans_type, total_trans_amount, transaction_date, customer_id, tix_trans_id, conc_trans_id)
VALUES ('Ticket', 94.95, '2023-10-30 19:30:00', 1, 1, NULL), 
	   ('Concession', 38.50, '2023-10-30 19:45:00', 1, NULL, 1);



       
       
      

       
