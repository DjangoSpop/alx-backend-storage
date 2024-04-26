-- WE WILL USE THE FOLLOWING SCHEMA
-- CREATE TABLE bonuses 
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
  DECLARE avg_score DECIMAL(10, 2);
  
  SELECT AVG(b.score * p.weight) INTO avg_score
  FROM bonuses b
  JOIN projects p
  ON b.project_id = p.id
  WHERE b.user_id = user_id;
  
  IF avg_score IS NULL THEN
    SET avg_score = 0;
  END IF;
  
  SELECT avg_score;
END
