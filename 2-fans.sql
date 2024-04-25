-- we can here create a select origin and count(*) as nb_fans from metal_bands
-- group by origin order by nb_fans desc
SELECT origin, COUNT(*) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;