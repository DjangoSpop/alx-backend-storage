DELIMITER // -- Delimiter to avoid conflicts with existing SQL statements

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
  DECLARE user_id INT;
  DECLARE user_cursor CURSOR FOR SELECT id FROM users;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET user_id = NULL;

  OPEN user_cursor;

  loop:
    FETCH user_cursor INTO user_id;
    IF user_id IS NULL THEN
      LEAVE loop;
    END IF;

    -- Call the previously created procedure for each user (uncomment if needed)
    -- CALL ComputeAverageWeightedScoreForUser(user_id);
  END loop;

  CLOSE user_cursor;

  -- Update user records with average weighted scores (optional, uncomment if needed)
  -- UPDATE users u
  -- JOIN (
  --   SELECT user_id, SUM(score * weight) / SUM(weight) AS average_weighted_score
  --   FROM scores s
  --   JOIN assignments a ON s.assignment_id = a.id
  --   GROUP BY user_id
  -- ) AS weighted_scores ON u.id = weighted_scores.user_id
  -- SET u.average_weighted_score = weighted_scores.average_weighted_score;
END //

DELIMITER ; -- Reset delimiter to semicolon
