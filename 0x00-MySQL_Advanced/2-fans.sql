-- Task: Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans

SELECT
    country AS origin,
    SUM(fans) AS nb_fans
FROM
    (SELECT
         b.country,
         COUNT(f.fan_id) AS fans
     FROM bands b
     JOIN band_members bm ON b.band_id = bm.band_id
     JOIN fans f ON bm.member_id = f.member_id
     GROUP BY b.band_id) AS subquery
GROUP BY country
ORDER BY nb_fans DESC;
