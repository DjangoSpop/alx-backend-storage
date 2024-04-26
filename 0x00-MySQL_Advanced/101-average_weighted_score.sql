-- create a stored procedure named ComputeAverageWeightedScoreForUsers that computes the average weighted score for each user and updates the users table with the computed values. The scores table contains the following columns: user_id, score, and weight. The users table contains the following columns: id and average_weighted_score. The average weighted score for a user is computed as the sum of (score * weight) divided by the sum of weight for that user. The average weighted score should be rounded to two decimal places. The stored procedure should use a temporary table to store the computed average weighted scores before updating the users table. The stored procedure should have the following signature:
-- CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Create a temporary table to store the computed average weighted scores
    CREATE TEMPORARY TABLE temp_average_weighted_scores (
        user_id INT,
        average_weighted_score DECIMAL(10, 2)
    );

    -- Compute the average weighted score for each user and insert into the temporary table
    INSERT INTO temp_average_weighted_scores (user_id, average_weighted_score)
    SELECT user_id, SUM(score * weight) / SUM(weight) AS average_weighted_score
    FROM scores
    GROUP BY user_id;

    -- Update the users table with the computed average weighted scores
    UPDATE users
    INNER JOIN temp_average_weighted_scores ON users.id = temp_average_weighted_scores.user_id
    SET users.average_weighted_score = temp_average_weighted_scores.average_weighted_score;

    -- Drop the temporary table
    DROP TABLE temp_average_weighted_scores;
END 
