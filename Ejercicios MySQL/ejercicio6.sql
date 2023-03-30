DROP TABLE IF EXISTS emp, dept;
CREATE TABLE DEPT(
    DEPT_NO int(2),
    DNOMBRE int(14),
    LOC int(14),
    CONSTRAINT DPTO_PK PRIMARY KEY (DEPT_NO)
);

CREATE TABLE EMP(
    EMP_NO int(4),
    APELLIDO VARCHAR(10) NOT NULL,
    OFICIO VARCHAR(10) NOT NULL,
    DIR int(4),
    FECHA_ALTA DATE,
    SALARIO int(10) NOT NULL,
    COMISIÓN int(10),
    DEPT_NO int(2),
    CONSTRAINT EMPLEADO_PK PRIMARY KEY (EMP_NO),
    CONSTRAINT DEPT2_FK FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO)
);
-- 1
SELECT CONCAT("El departamento de ", `DNOMBRE`, "se encuentra en ",`LOC`)
FROM dept;

--2
SELECT `OFICIO`,`APELLIDO`
FROM `emp` 
WHERE `APELLIDO` like "%n%"
ORDER BY `APELLIDO`;

--3
SELECT (`SALARIO`+`COMISIÓN`) 
FROM `emp` 
ORDER BY `SALARIO`,`APELLIDO` desc;

--4
SELECT (`SALARIO`+`COMISIÓN`+(`SALARIO`*0.15)) as "Salario Total"
FROM `emp` 
WHERE `SALARIO` IS NULL 
OR `COMISIÓN` > (`SALARIO`*0.15)
ORDER BY `OFICIO`,(`SALARIO`+`COMISIÓN`+(`SALARIO`*0.15)) desc;

--13
SELECT `APELLIDO`,`OFICIO`,`FECHA_ALTA`
FROM `emp`
WHERE `SALARIO` > 150000
AND `DEPT_NO` = 20
AND `FECHA_ALTA` is not null;

--14
SELECT `APELLIDO`,`OFICIO`,`FECHA_ALTA`
FROM `emp`
WHERE YEAR(`FECHA_ALTA`) < 2018
ORDER BY `OFICIO`

--15
SELECT AVG(`SALARIO`)
FROM `emp` 
WHERE `OFICIO` like "analista"
LIMIT 1;

--16
SELECT  MAX(`salario`) as "Salario maximo", 
        MIN(`salario`) as "Salario minimo",  
        (MAX(`salario`)-MIN(`salario`)) as "Diferencia Salarial"
FROM `emp`;

--17 
SELECT count(DISTINCT `oficio`)
FROM emp 
WHERE `dept_no` = 10
AND `dept_no`= 20;


-- 18
SELECT COUNT(*), `oficio`
FROM emp
GROUP BY dept_no, `oficio`;

-- 19
SELECT AVG(`SALARIO`+`COMISIoN`)
FROM emp
WHERE `oficio` LIKE "Vendedor";

-- 20
SELECT AVG(`SALARIO`+`COMISIoN`)
FROM emp
WHERE `oficio` LIKE "Vendedor" and `oficio` LIKE "empleado";

-- 21
SELECT MAX(`salario`), SUM(`salario`)
FROM emp
WHERE SUM(`salario`) > MAX(`salario`)

-- 22
SELECT e.`apellido`,e.`oficio`,e.`dept_no`, d.dnombre
FROM `emp` e, dept d
WHERE e.dept_no = d.dept_no;

-- 23
SELECT d.dnombre, e.oficio, d.loc
FROM `emp` e, dept d
WHERE e.dept_no = d.dept_no;

-- 24
SELECT e.apellido, d.loc
FROM emp e, dept d
WHERE e.dept_no = d.dept_no
AND d.loc like "madrid"
ORDER BY e.oficio;

-- 25
SELECT COUNT(*), dept_no 
FROM `emp` 
GROUP BY dept_no
ORDER BY COUNT(*);

-- 26
SELECT MAX(`salario`) as "Maximo", MIN(`salario`) as "Minimo", SUM(`salario`) as "Suma" 
FROM `emp` 
WHERE `dept_no` in (SELECT dnombre
                  FROM dept
                  where dnombre LIKE "ventas"
                  OR dnombre like "contabilidad");


-- 28
SELECT `emp_no`,`apellido`,`oficio` 
FROM `emp` 
WHERE `dir` is not null
ORDER BY `apellido`;

-- 29
SELECT `apellido`,`dept_no`,`oficio`
FROM `emp`
WHERE `dept_no` in (SELECT dept_no
                  FROM dept
                  WHERE dnombre not like "ventas"
                  AND dept_no = 20);

-- 30
SELECT `emp_no`,`apellido`,`dept_no`
FROM `emp`
WHERE `dept_no` IN ( 20, 30)
AND `oficio` not LIKE "presidente"
AND `salario` > (SELECT (2 * (MIN(`salario`)))
                 FROM emp
                );
                 

-- 31
SELECT `apellido`,`oficio`,`dept_no`
FROM `emp`
WHERE `salario` > (SELECT MAX(`salario`)
                   FROM emp
                   WHERE `dept_no` = 30)
                   ;

-- 32
SELECT `apellido`,`oficio`
FROM `emp`
WHERE `dept_no` = 20
AND `oficio` in (SELECT `oficio`
                 FROM emp
                 WHERE `dept_no` = (SELECT dept_no
                                   FROM dept
                                   WHERE dnombre LIKE "ventas" ));

-- 33
SELECT *
FROM `emp`
WHERE (`salario` <> (SELECT MAX(`salario`)
                     FROM emp)
OR `salario` <> (SELECT MIN(`salario`)
                FROM emp));

-- 34
SELECT dept_no, MIN(salario) as mínimo,MAX(salario) as maximo
FROM emp e
WHERE SUBSTRING(apellido, 1, 1) NOT IN (
        SELECT SUBSTRING(dnombre, 1, 1)
        FROM dept d
        WHERE e.dept_no = d.dept_no
    )
GROUP BY dept_no
HAVING MAX(salario) - MIN(salario) > (
        SELECT AVG(salario)
        FROM emp);

