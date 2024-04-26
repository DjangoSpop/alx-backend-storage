-- Task: Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans

SELECT 
   b.country AS origin,
   COUNT(DISTINCT f.fan_id) AS nb_fans
FROM bands b
JOIN band_members bm ON b.band_id = bm.band_id
JOIN fans f ON bm.member_id = f.member_id
GROUP BY b.country
ORDER BY nb_fans DESC;
