-- Assuming the table is named 'metal_bands'
SELECT band_name, 
       2022 - formed_year AS lifespan  /* Calculate lifespan using formed year */
FROM metal_bands
WHERE band_name LIKE '%Glam rock%'  /* Filter for bands with 'Glam rock' in their style */
ORDER BY lifespan DESC; 