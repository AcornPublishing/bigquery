-- With a straight loop
DECLARE I INT64 DEFAULT 0;
DECLARE R ARRAY<INT64> DEFAULT [];
LOOP
  SET I = I + 1;
  SET R = ARRAY_CONCAT(R, [I]);
  IF I > 9 THEN LEAVE;
END IF;
END LOOP;
SELECT * FROM UNNEST(R);

-- With a WHILE loop
DECLARE I INT64 DEFAULT 0;
DECLARE R ARRAY<INT64> DEFAULT [];
WHILE I < 10 DO
  SET I = I + 1;
  SET R = ARRAY_CONCAT(R, [I]);
          
END WHILE;
SELECT * FROM UNNEST(R);

-- Using a built-in BigQuery function
SELECT * FROM UNNEST(GENERATE_ARRAY(1,10));