select
    dept_no,
    min(salario) mínimo,
    max(salario) maximo
from
    emp e
where
    substr(apellido, 1, 1) not in (
        select
            substr (dnombre, 1, 1)
        from
            dept2 d
        where
            e.dept_no = d.dept_no
    )
group by
    dept_no
having
    max(salario) - min(salario) > (
        select
            avg(salario)
        from
            emp
    );