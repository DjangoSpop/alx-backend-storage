-- we must explain creating a trigger that triggers a behavior when a new order is inserted into the orders table.
-- The trigger should decrease the quantity of the item in the items table by the number of items ordered.
CREATE TRIGGER decrease_quantity
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name;
