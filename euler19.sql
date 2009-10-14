WITH RECURSIVE t(a) AS (
        VALUES(TIMESTAMP '1901-01-01')
    UNION ALL
        SELECT (a::TIMESTAMP + interval '1 day')
        FROM t
        WHERE EXTRACT(YEAR FROM a::timestamp) < 2001
        )
SELECT count(*) FROM t
 WHERE EXTRACT(DOW FROM a::TIMESTAMP) = 0 AND EXTRACT(DAY FROM a::TIMESTAMP) = 1;


