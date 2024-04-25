-- Head: 3.1-glam_rock.sql
-- we here create a sql script that creates a table of metal bands that have
SELECT band_name, (2022 - IFNULL(YEAR(formed), 2022)) - IFNULL(YEAR(split), 0) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
