-- begin test 320 subquery in result set
SELECT sum(a), max(c),
       avg((SELECT a FROM z2 WHERE 5+z2.b=z1.b) AND rowid<250), max(c)
 FROM z1 WHERE rowid<250;
-- end test 320
