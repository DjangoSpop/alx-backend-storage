-- stored porcedure store average score
--  @param student_id int the id of a
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
  DECLARE avg_score DECIMAL(10, 2);
  
  SELECT AVG(score) INTO avg_score
  FROM bonuses
  WHERE user_id = user_id;
  
  IF avg_score IS NULL THEN
    SET avg_score = 0;
  END IF;
  
  SELECT avg_score;
END 
