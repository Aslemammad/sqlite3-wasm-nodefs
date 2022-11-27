-- begin test 300 Refill a 12500-row table using (b&1)==(a&1)
DELETE FROM z2;;
INSERT INTO z2(a,b,c)
 SELECT a,b,c FROM z1  WHERE (b&1)==(a&1);;
INSERT INTO z2(a,b,c)
 SELECT a,b,c FROM z1  WHERE (b&1)<>(a&1);;
-- end test 300
