-- Assuming the table is named 'metal_bands'
SELECT 
    country AS origin,
    COUNT(fan_id) AS nb_fans
FROM bands b
JOIN band_members bm ON b.band_id = bm.band_id
JOIN fans f ON bm.member_id = f.member_id
GROUP BY country
ORDER BY nb_fans DESC;
