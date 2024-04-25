-- a procdure a behavior 
-- a procedure that computes the average weighted score for each user in the Users table and updates the AverageWeightedScore column with the computed values. The average weighted score for a user is calculated by summing the product of the Score and Weight columns from the Scores table and dividing by the sum of the Weight column for that user.
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers
AS
BEGIN
    -- Create a temporary table to store the computed average weighted scores
    CREATE TABLE #TempAverageWeightedScores
    (
        UserId INT,
        AverageWeightedScore DECIMAL(10, 2)
    )

    -- Compute and insert the average weighted scores into the temporary table
    INSERT INTO #TempAverageWeightedScores (UserId, AverageWeightedScore)
    SELECT UserId, SUM(Score * Weight) / SUM(Weight) AS AverageWeightedScore
    FROM Scores
    GROUP BY UserId

    -- Update the Users table with the computed average weighted scores
    UPDATE Users
    SET AverageWeightedScore = t.AverageWeightedScore
    FROM Users u
    INNER JOIN #TempAverageWeightedScores t ON u.UserId = t.UserId

    -- Drop the temporary table
    DROP TABLE #TempAverageWeightedScores
END