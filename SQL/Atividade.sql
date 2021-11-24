-- a) Encontre a MATRÍCULA(s) dos alunos com nota em BD12015-1menor que 90;
SELECT matricula 
FROM tb_historico_academico 
WHERE nota > 90
AND codigo_turma = 'BD12015-1';


--b) Encontre a MATRÍCULA(s) e calcule a média das notas dos alunos na disciplina de POO2015-1. 

SELECT matricula , AVG(nota) as media
FROM tb_historico_academico 
WHERE codigo_turma = 'POO2015-1'
GROUP BY matricula;

--c) Encontre o CODIGO do professor que ministra a turma WEB2015-1.

SELECT codigo_professor
FROM tb_turma
WHERE codigo_turma = 'WEB2015-1';

-- d) Gere o histórico completo do aluno 2015010106 mostrando MATRICULA,CODIGO DA TURMA, CODIGO DA DISCIPLINA, CODIGO PROFESSOR, FREQUENCIA,NOTA.

SELECT tb_pessoa.nome,
tb_alunos.matricula, 
tb_h.codigo_turma, 
tb_turma.codigo_disciplina, 
tb_turma.codigo_professor, 
tb_h.frequencia, 
tb_h.nota
FROM tb_alunos
JOIN tb_historico_academico as tb_h on tb_h.matricula = tb_alunos.matricula
JOIN tb_pessoa on id_pessoa = tb_pessoa.id
JOIN tb_turma on tb_h.codigo_turma = tb_turma.codigo_turma
WHERE tb_alunos.matricula = 2015010106

