-- begin test 130 25 SELECTS, numeric BETWEEN, unindexed
BEGIN;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 10905 AND 10913;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 16018 AND 16023;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 11836 AND 11841;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 3876 AND 3880;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 15503 AND 15506;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 7318 AND 7321;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 1460 AND 1463;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 13121 AND 13129;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 6256 AND 6261;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 10900 AND 10904;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 15788 AND 15794;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 7549 AND 7556;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 8084 AND 8088;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 2598 AND 2605;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 5026 AND 5031;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 4717 AND 4726;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 9748 AND 9750;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 2293 AND 2295;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 11490 AND 11498;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 2368 AND 2372;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 5027 AND 5033;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 793 AND 804;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 8112 AND 8116;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 15153 AND 15157;
SELECT count(*), avg(b), sum(length(c)), group_concat(c) FROM z1
 WHERE b BETWEEN 6646 AND 6656;
COMMIT;
-- end test 130
