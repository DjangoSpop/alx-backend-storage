DELIMITER // -- Delimiter to avoid conflicts with existing SQL statements

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
  IN user_id INT
)
BEGIN
  DECLARE average_score DECIMAL(5, 2);  -- Declare variable for average weighted score (5 digits total, 2 decimal places)

  -- Calculate weighted sum and total weight using subqueries
  SELECT SUM(score * weight) AS weighted_sum, SUM(weight) AS total_weight
  FROM scores s
  JOIN assignments a ON s.assignment_id = a.id
  WHERE s.user_id = user_id;

  -- Calculate average weighted score (if total_weight is not zero)
  IF SUM(weight) > 0 THEN  -- Check for non-zero total weight to avoid division by zero
    SET average_score = SUM(score * weight) / SUM(weight);
  ELSE
    SET average_score = NULL;  -- Set average_score to NULL if no weights or invalid weights
  END IF;

  -- Update user record with average weighted score (optional)
  -- UNCOMMENT the following line if you want to store the average score in a user table column
  -- UPDATE users SET average_weighted_score = average_score WHERE id = user_id;

  -- Display or return the average weighted score (modify as needed)
  SELECT average_score;  -- You can modify this line to display or return the average score in different ways

END //

DELIMITER ; -- Reset delimiter to semicolon
