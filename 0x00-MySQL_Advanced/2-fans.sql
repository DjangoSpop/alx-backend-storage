-- Assuming the table is named 'metal_bands'
-- Write a query that returns the number of fans for each country of origin of the bands. The query should return the following columns:
SELECT 
       country AS origin,
       COUNT(fan_id) AS nb_fans
FROM bands b
JOIN band_members bm ON b.band_id = bm.band_id
JOIN fans f ON bm.member_id = f.member_id
GROUP BY country
ORDER BY nb_fans DESC;
