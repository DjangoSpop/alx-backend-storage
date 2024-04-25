-- This script creates a trigger that sets the valid_email field to 0 if the email field is updated.
-- The trigger is executed before the update operation.
CREATE TRIGGER update_email
BEFORE UPDATE ON users
FOR EACH ROW
SET NEW.valid_email = CASE
    WHEN NEW.email <> OLD.email THEN 0
    ELSE NEW.valid_email
END;