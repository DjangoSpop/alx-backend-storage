-- Create a temporary table to store the rankings
CREATE TEMPORARY TABLE temp_rankings AS
SELECT origin, SUM(nb_fans) AS total_fans
FROM metal_bands
GROUP BY origin
ORDER BY total_fans DESC;

-- Add a rank column to the rankings table
ALTER TABLE temp_rankings
ADD COLUMN rank INT;

-- Update the rank column with the corresponding ranks
SET @rank := 0;
UPDATE temp_rankings
SET rank = (@rank := @rank + 1);

-- Select the final rankings
SELECT origin, total_fans, rank
FROM temp_rankings
ORDER BY rank;

-- Drop the temporary table
DROP TABLE temp_rankings;