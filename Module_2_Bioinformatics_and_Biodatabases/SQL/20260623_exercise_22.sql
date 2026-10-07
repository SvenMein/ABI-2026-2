-- Changing Tables
ALTER TABLE teachers
ADD COLUMN title varchar(255),
ADD COLUMN Address varchar(255),
ADD COLUMN City varchar(255);

ALTER TABLE publishers
ADD COLUMN Postal_Code varchar(255);

ALTER TABLE teaches
RENAME COLUMN Hours TO Time_Tought;

ALTER TABLE visits
RENAME COLUMN Hours TO Time_visited;

ALTER TABLE wrote
RENAME written_by;

ALTER TABLE books
DROP COLUMN Translator_ID;