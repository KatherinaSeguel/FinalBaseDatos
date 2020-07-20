select count(tes.id_curso),cur.idcurso,cur.descrip
from curso cur
LEFT join testeva tes
on cur.idcurso=tes.id_curso
GROUP BY tes.curso_idcurso,cur.idcurso,cur.descrip



Select tes.idtest,count(preg.numpre)
from tdigital.testeva tes
LEFT join tdigital.preguntas preg
on tes.idtest=preg.idtest
GROUP BY tes.idtest



Select preg.idtest,preg.numpre,count(alt.altern)
from tdigital.preguntas preg
LEFT join tdigital.alternativas alt
on preg.idtest= alt.id_test and
preg.numpre=alt.id_preg
GROUP BY preg.idtest,preg.numpre
order by preg.idtest,preg.numpre


Select preg.idtest,preg.numpre,count(alt.altern)
from tdigital.preguntas preg
LEFT join tdigital.alternativas alt
on preg.idtest= alt.id_test and
preg.numpre=alt.id_preg and
alt.valorlogico='F'
GROUP BY preg.idtest,preg.numpre
order by preg.idtest,preg.numpre


Select cur.idcurso,count(est.idestu)
from tdigital.curso cur
LEFT join tdigital.estudiante est
on cur.idcurso=est.idcurso
GROUP BY cur.idcurso


select *
from
(Select est.idestu,est.idcurso as curso,est.nombre,res.idtest as ntest,sum(res.puntaje) as NOTA
from  tdigital.estudiante est   
LEFT join tdigital.respuestas res
on  est.idestu=res.idalumno
GROUP BY est.idestu,est.idcurso,est.nombre,res.idtest
order by est.idestu,est.idcurso,est.nombre,res.idtest)
where curso=1 and ntest=1

