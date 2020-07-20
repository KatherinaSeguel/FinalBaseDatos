1. Pregunta 1: Conocer el número de evaluaciones por curso.

select count(tes.id_curso),cur.idcurso,cur.descrip
from curso cur
RIGHT join testeva tes
on cur.idcurso=tes.id_curso
GROUP BY tes.curso_idcurso,cur.idcurso,cur.descrip



COUNT(TES.ID_CURSO)    IDCURSO DESCRIP                       
------------------- ---------- ------------------------------
                  2          1 Programación Básica en Java   
                  1          2 Lenguaje de Base de Datos     

2. Pregunta 2: Conocer los cursos sin evaluaciones.


select count(tes.id_curso),cur.idcurso,cur.descrip
from curso cur
LEFT join testeva tes
on cur.idcurso=tes.id_curso
GROUP BY tes.curso_idcurso,cur.idcurso,cur.descrip


COUNT(TES.ID_CURSO)    IDCURSO DESCRIP                       
------------------- ---------- ------------------------------
                  2          1 Programación Básica en Java   
                  1          2 Lenguaje de Base de Datos     
                  0          3 Programación Android          


3. Pregunta 3: Determinar las evaluaciones con deficiencia. Una evaluación es deficiente:

a. Si no tiene preguntas.
b. Si hay preguntas con 2 ó menos alternativas
c. Si todas las alternativas son correctas o si todas las alternativas son incorrectas.

Solución a) ver qué test no tiene preguntas:

Select tes.idtest,count(preg.numpre)
from tdigital.testeva tes
LEFT join tdigital.preguntas preg
on tes.idtest=preg.idtest
GROUP BY tes.idtest



    IDTEST COUNT(PREG.NUMPRE)
---------- ------------------
         1                 10
         2                 10
         3                  0



Solución b) Si hay preguntas con 2 ó menos alternativas

Select preg.idtest,preg.numpre,count(alt.altern)
from tdigital.preguntas preg
LEFT join tdigital.alternativas alt
on preg.idtest= alt.id_test and
preg.numpre=alt.id_preg
GROUP BY preg.idtest,preg.numpre
order by preg.idtest,preg.numpre


    IDTEST     NUMPRE COUNT(ALT.ALTERN)
---------- ---------- -----------------
         1          1                 4
         1          2                 4
         1          3                 4
         1          4                 4
         1          5                 4
         1          6                 4
         1          7                 4
         1          8                 4
         1          9                 4
         1         10                 4
         2          1                 4

    IDTEST     NUMPRE COUNT(ALT.ALTERN)
---------- ---------- -----------------
         2          2                 4
         2          3                 4
         2          4                 4
         2          5                 4
         2          6                 4
         2          7                 4
         2          8                 4
         2          9                 4
         2         10                 4

20 filas seleccionadas. 

Solución c) Si todas las alternativas son correctas o si todas las alternativas son incorrectas.

CUENTO LAS ALTERNATIVAS V

Select preg.idtest,preg.numpre,count(alt.altern)
from tdigital.preguntas preg
LEFT join tdigital.alternativas alt
on preg.idtest= alt.id_test and
preg.numpre=alt.id_preg and
alt.valorlogico='V'
GROUP BY preg.idtest,preg.numpre
order by preg.idtest,preg.numpre


    IDTEST     NUMPRE COUNT(ALT.ALTERN)
---------- ---------- -----------------
         1          1                 3
         1          2                 3
         1          3                 3
         1          4                 3
         1          5                 3
         1          6                 3
         1          7                 3
         1          8                 3
         1          9                 3
         1         10                 3
         2          1                 3

    IDTEST     NUMPRE COUNT(ALT.ALTERN)
---------- ---------- -----------------
         2          2                 3
         2          3                 3
         2          4                 3
         2          5                 3
         2          6                 3
         2          7                 3
         2          8                 3
         2          9                 3
         2         10                 3

20 filas seleccionadas. 

CUENTO LAS ALTERNATIVAS FALSAS:

Select preg.idtest,preg.numpre,count(alt.altern)
from tdigital.preguntas preg
LEFT join tdigital.alternativas alt
on preg.idtest= alt.id_test and
preg.numpre=alt.id_preg and
alt.valorlogico='F'
GROUP BY preg.idtest,preg.numpre
order by preg.idtest,preg.numpre


    IDTEST     NUMPRE COUNT(ALT.ALTERN)
---------- ---------- -----------------
         1          1                 1
         1          2                 1
         1          3                 1
         1          4                 1
         1          5                 1
         1          6                 1
         1          7                 1
         1          8                 1
         1          9                 1
         1         10                 1
         2          1                 1

    IDTEST     NUMPRE COUNT(ALT.ALTERN)
---------- ---------- -----------------
         2          2                 1
         2          3                 1
         2          4                 1
         2          5                 1
         2          6                 1
         2          7                 1
         2          8                 1
         2          9                 1
         2         10                 1

20 filas seleccionadas. 


4. Pregunta 4: Determinar cuántos alumnos hay en cada curso.


Select cur.idcurso,count(est.idestu)
from tdigital.curso cur
LEFT join tdigital.estudiante est
on cur.idcurso=est.idcurso
GROUP BY cur.idcurso


   IDCURSO COUNT(EST.IDESTU)
---------- -----------------
         1                10
         2                10
         3                 0



5. Pregunta 5: Obtener el puntaje no normalizado de cada evaluación. El puntaje no
normalizado ha sido definido (requerimiento) como: P = buenas – malas/4. Si un alumno
no contesta en una pregunta exactamente lo mismo que se ha definido como correcto,
la pregunta cuenta como mala a menos que el alumno haya omitido.

1) RESPUESTAS CORRECTAS POR ALUMNO Y TEST

Select res.idalumno,res.idtest,count(res.alternativa) as correctas
from  tdigital.respuestas res   
LEFT join tdigital.alternativas alt
on res.idtest=alt.id_test and
res.idpreg=alt.id_preg and
res.alternativa=alt.altern and
res.resp=alt.valorlogico
GROUP BY res.idalumno,res.idtest
order by res.idalumno,res.idtest


  IDALUMNO     IDTEST  CORRECTAS
---------- ---------- ----------
1010101010          1         37
1111111111          1         37
1112111111          2         37
1212121212          2         37
1313131313          2         37
1414141414          2         37
1515151515          2         37
1616161616          2         37
1717171717          2         37
1818181818          2         37
1919191919          2         37

  IDALUMNO     IDTEST  CORRECTAS
---------- ---------- ----------
2020202020          2         37
2222222222          1         37
3333333333          1         37
4444444444          1         37
5555555555          1         37
6666666666          1         37
7777777777          1         37
8888888888          1         37
9999999999          1         37

20 filas seleccionadas. 

2)RESPUESTAS INCORRECTAS POR ALUMNO Y TEST

Select res.idalumno,res.idtest,count(res.alternativa) as incorrectas
from  tdigital.respuestas res   
LEFT join tdigital.alternativas alt
on res.idtest=alt.id_test and
res.idpreg=alt.id_preg and
res.alternativa<>alt.altern and
res.resp<>alt.valorlogico
GROUP BY res.idalumno,res.idtest
order by res.idalumno,res.idtest

  IDALUMNO     IDTEST INCORRECTAS
---------- ---------- -----------
1010101010          1          63
1111111111          1          52
1112111111          2          71
1212121212          2          71
1313131313          2          71
1414141414          2          71
1515151515          2          71
1616161616          2          71
1717171717          2          71
1818181818          2          71
1919191919          2          71

  IDALUMNO     IDTEST INCORRECTAS
---------- ---------- -----------
2020202020          2          71
2222222222          1          65
3333333333          1          65
4444444444          1          65
5555555555          1          65
6666666666          1          63
7777777777          1          63
8888888888          1          63
9999999999          1          63

20 filas seleccionadas. 

NOTA : PARA SACAR RESULTADO LAS NOTAS POR ALUMNO SE RESTARIAN Y DIVIDIRIAN POR 4.

6. Pregunta 6: Obtener el puntaje normalizado, o sea, de 1,0 a 7,0.

Select res.idalumno,res.idtest,sum(res.puntaje) as NOTA
from  tdigital.respuestas res   
LEFT join tdigital.alternativas alt
on res.idtest=alt.id_test and
res.idpreg=alt.id_preg and
res.alternativa=alt.altern and
res.resp=alt.valorlogico
GROUP BY res.idalumno,res.idtest
order by res.idalumno,res.idtest

  IDALUMNO     IDTEST       NOTA
---------- ---------- ----------
1010101010          1         56
1111111111          1         77
1112111111          2         42
1212121212          2         42
1313131313          2         42
1414141414          2         42
1515151515          2         42
1616161616          2         42
1717171717          2         42
1818181818          2         42
1919191919          2         42

  IDALUMNO     IDTEST       NOTA
---------- ---------- ----------
2020202020          2         42
2222222222          1         52
3333333333          1         52
4444444444          1         52
5555555555          1         52
6666666666          1         56
7777777777          1         56
8888888888          1         56
9999999999          1         56

20 filas seleccionadas. 

7. Pregunta 7: Nombre de estudiantes de un curso determinado que aprueban una
evaluación determinada (donde la nota de aprobación mínima es un 4,0).

select *
from
(Select est.idestu,est.idcurso,est.nombre,sum(res.puntaje) as NOTA
from  tdigital.estudiante est   
LEFT join tdigital.respuestas res
on  est.idestu=res.idalumno
GROUP BY est.idestu,est.idcurso,est.nombre
order by est.idestu,est.idcurso,est.nombre)
where nota<60

    IDESTU    IDCURSO NOMBRE                               NOTA
---------- ---------- ------------------------------ ----------
1010101010          1 Paola                                  56
1112111111          2 Elizabhet                              42
1212121212          2 Armando                                42
1313131313          2 Eduardo                                42
1414141414          2 Felipe                                 42
1515151515          2 Daniel                                 42
1616161616          2 Raúl                                   42
1717171717          2 Pancho                                 42
1818181818          2 Oscar                                  42
1919191919          2 Felipe                                 42
2020202020          2 Omar                                   42

    IDESTU    IDCURSO NOMBRE                               NOTA
---------- ---------- ------------------------------ ----------
2222222222          1 Romina                                 52
3333333333          1 Paz                                    52
4444444444          1 Marco                                  52
5555555555          1 Francisca                              52
6666666666          1 Manuel                                 56
7777777777          1 José                                   56
8888888888          1 Luisa                                  56
9999999999          1 Maca                                   56

19 filas seleccionadas. 


8. Pregunta 8: Nota promedio de los estudiantes de un curso determinado, para una
evaluación de terminada.

select *
from
(Select est.idestu,est.idcurso as curso,est.nombre,res.idtest as ntest,sum(res.puntaje) as NOTA
from  tdigital.estudiante est   
LEFT join tdigital.respuestas res
on  est.idestu=res.idalumno
GROUP BY est.idestu,est.idcurso,est.nombre,res.idtest
order by est.idestu,est.idcurso,est.nombre,res.idtest)
where curso=1 and ntest=1

    IDESTU      CURSO NOMBRE                              NTEST       NOTA
---------- ---------- ------------------------------ ---------- ----------
1010101010          1 Paola                                   1         56
1111111111          1 Juan                                    1         77
2222222222          1 Romina                                  1         52
3333333333          1 Paz                                     1         52
4444444444          1 Marco                                   1         52
5555555555          1 Francisca                               1         52
6666666666          1 Manuel                                  1         56
7777777777          1 José                                    1         56
8888888888          1 Luisa                                   1         56
9999999999          1 Maca                                    1         56

10 filas seleccionadas. 