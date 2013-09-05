
-- drop table tarray

CREATE TABLE tarray
(
	code serial primary key,
	analisis text[][]
);


INSERT INTO tarray(analisis) values('{{CuTo, 0.21},{CuOx, 0.234}, {Ag, 0.384}}');
INSERT INTO tarray(analisis) values('{{CuTo, 0.00},{CuOx, 0.032}, {Ag, 0.343}}');
INSERT INTO tarray(analisis) values('{{CuTo, 0.19},{CuOx, 0.164}, {Ag, 0.047}}');
INSERT INTO tarray(analisis) values('{{CuTo, 0.17},{CuOx, 0.393}, {Ag, 0.149}}');
INSERT INTO tarray(analisis) values('{{CuTo, 0.23},{CuOx, 0.823}, {Ag, 0.195}}');
INSERT INTO tarray(analisis) values('{{CuTo, 0.14},{CuOx, 0.295}, {Ag, 0.419}}');


select * from tarray;

select analisis[2][2] from tarray where analisis[2][1] = 'CuOx'

update tarray
set analisis[2][2] = '43'
where code = 3 and analisis[2][1] = 'CuOx'

update tarray
set analisis = '{{CuTo,22},{CuOx,22},{Ag,22}}'
where code = 3;

-- drop table sal_emp
CREATE TABLE sal_emp (
    name            text,
    pay_by_quarter  integer[],
    schedule        text[][]
);


INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"meeting", "lunch"}, {"training", "presentation"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"CuTo", "0.23"}, {"CuOx", "0.25"}, {"Ag", "0.27"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"x", "4"}, {"y", 45}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');

select * from sal_emp;
SELECT name FROM sal_emp WHERE pay_by_quarter[1] = 10000;

SELECT pay_by_quarter[3], schedule[1][1] FROM sal_emp