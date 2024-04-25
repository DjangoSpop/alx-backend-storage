-- creation of the procudeures 
-- creation of an average function for the user to use in their own code.

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    SELECT AVG(score) INTO avg_score
    FROM scores
    WHERE user_id = user_id;

    INSERT INTO average_scores (user_id, average_score)
    VALUES (user_id, avg_score);
END //

DELIMITER ;