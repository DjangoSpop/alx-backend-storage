-- Import the table dump
-- This step depends on your SQL database management system. 
-- For example, in MySQL, you would use the SOURCE command in the MySQL shell:
SOURCE C:\Users\ahmed el bahi\alx-backend-storage\metal_bands.sql;

-- Query to list all bands with Glam rock as their main style, ranked by their longevity
SELECT 
    band_name, 
    (CASE 
        WHEN split IS NULL THEN 2022 - formed 
        ELSE split - formed 
    END) AS lifespan
FROM 
    metal_bands
WHERE 
    main_style = 'Glam rock'
ORDER BY 
    lifespan DESC;