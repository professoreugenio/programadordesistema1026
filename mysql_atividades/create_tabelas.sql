use escola_bd;
use chat_bd;
CREATE TABLE alunos (
id_aluno int primary key auto_increment,
nome varchar(100) not null,
rg varchar(20) unique not null,
cpf varchar(20) unique not null,
datanascimento DATE NOT null,
cidade varchar(80) not null,
data_cadastro timestamp default current_timestamp
);

CREATE TABLE curso (
id_curso int primary key auto_increment,
nome varchar(80) not null
);

create table matricula (
id_matricula int primary key auto_increment,
id_aluno int not null,
id_curso int not null,
data_matricula timestamp default current_timestamp
)
