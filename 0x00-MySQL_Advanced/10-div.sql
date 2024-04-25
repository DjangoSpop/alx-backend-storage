-- 10. Safe divide
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
RETURN CASE
    WHEN b = 0 THEN 0
    ELSE a / b
END;