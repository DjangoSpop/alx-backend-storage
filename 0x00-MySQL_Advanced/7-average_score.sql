DELIMITER // -- Delimiter to avoid conflicts with existing SQL statements

CREATE PROCEDURE ComputeAverageScoreForUser (
  IN user_id INT
)
BEGIN
  DECLARE average_score DECIMAL(5, 2);  -- Declare variable for average score (5 digits total, 2 decimal places)

  -- Calculate average score using subquery
  SELECT AVG(score) INTO average_score
  FROM scores
  WHERE user_id = user_id;

  -- Update user record with average score (optional)
  -- UNCOMMENT the following line if you want to store the average score in a user table column
  -- UPDATE users SET average_score = average_score WHERE id = user_id;

  -- Display or return the average score (modify as needed)
  SELECT average_score;  -- You can modify this line to display or return the average score in different ways

END //

DELIMITER ; -- Reset delimiter to semicolon
