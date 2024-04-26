DELIMITER // -- Delimiter to avoid conflicts with existing SQL statements

CREATE PROCEDURE AddBonus (
  IN user_id INT,
  IN project_name VARCHAR(255),
  IN score INT
)
BEGIN
  DECLARE project_id INT;

  -- Check if project exists
  SELECT id INTO project_id FROM projects WHERE name = project_name;

  IF project_id IS NULL THEN
    -- Create new project if it doesn't exist
    INSERT INTO projects (name) VALUES (project_name);
    SET project_id = LAST_INSERT_ID();
  END IF;

  -- Insert bonus record
  INSERT INTO bonuses (user_id, project_id, score) VALUES (user_id, project_id, score);
END //

DELIMITER ; -- Reset delimiter to semicolon
