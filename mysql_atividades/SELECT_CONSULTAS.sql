use escola_bd;
/*CONSULTA TUDO *, EXIBE TUDO*/
select * from alunos;
/* CONSULTA TUDO, EXIBE ALGUNS CAMPOS*/
describe alunos;
select * from alunos;
select nome,rg,cpf from alunos;
/*EXIBINDO EM ORDEM CRESCENTE/DECRESCENTE*/
SELECT * from alunos ORDER BY nome;
/* padrão ASC (CRESCENTE) DESC(DECRESCENTE)*/
select * from alunos ORDER BY nome DESC;
/* Selecionando com limite de resultador */
select * from alunos limit 1;
/* Selecinando quando um valor pesquisado */
select * from alunos where cidade = 'Fortaleza' order by nome;
/* Selecionado por partes de um dado use LIKE */
/* O % quer dizer qualquer coisa antes ou depois*/
select * from alunos where data_nascimento like '1999%';
select * from alunos where cidade like '%for%';
select * from alunos where nome like '%pedro%';

