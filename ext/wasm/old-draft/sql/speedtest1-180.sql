-- begin test 180 12500 INSERTS with three indexes
BEGIN;
CREATE TABLE t4(
  a INTEGER  UNIQUE,
  b INTEGER ,
  c TEXT 
) ;
CREATE INDEX t4b ON t4(b);
CREATE INDEX t4c ON t4(c);
INSERT INTO t4 SELECT * FROM z1;
COMMIT;
-- end test 180
