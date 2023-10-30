ALTER TABLE MovieShowings DROP CONSTRAINT movieshowings_ticket_id_fkey;

ALTER TABLE Movieshowings DROP COLUMN ticket_id;

ALTER TABLE Movies DROP CONSTRAINT movies_customer_id_fkey;

ALTER TABLE Movies DROP COLUMN customer_id;

ALTER TABLE theaterrooms RENAME COLUMN exit_door_num TO exit_door_count; 



      
      