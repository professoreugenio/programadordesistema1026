/* salvar como inserindo registros */
use escola_bd;
insert into alunos(nome,data_nascimento,rg,cpf,cidade,status  ) 
values ("Eugênio Márcio","1971-03-07","100000000009","100000000001","Quixeramobim","0");
SELECT * FROM alunos;

INSERT INTO alunos
(nome, data_nascimento, rg, cpf, cidade, status)
VALUES
('João Pedro Silva', '2002-03-15', 'RG100001', 'CPF100001', 'Fortaleza', 1),
('Maria Eduarda Santos', '2001-07-22', 'RG100002', 'CPF100002', 'Maracanaú', 1),
('Carlos Henrique Lima', '2000-11-10', 'RG100003', 'CPF100003', 'Caucaia', 1),
('Ana Paula Oliveira', '2003-01-05', 'RG100004', 'CPF100004', 'Pacatuba', 1),
('Pedro Lucas Ferreira', '1999-09-18', 'RG100005', 'CPF100005', 'Fortaleza', 1),
('Juliana Costa', '2002-12-30', 'RG100006', 'CPF100006', 'Maranguape', 1),
('Rafael Almeida', '2001-05-14', 'RG100007', 'CPF100007', 'Maracanaú', 0),
('Fernanda Rocha', '2004-08-09', 'RG100008', 'CPF100008', 'Fortaleza', 1),
('Lucas Gabriel Martins', '2000-02-25', 'RG100009', 'CPF100009', 'Caucaia', 1),
('Camila Rodrigues', '2003-06-17', 'RG100010', 'CPF100010', 'Pacatuba', 0),
('Bruno Carvalho', '1998-10-03', 'RG100011', 'CPF100011', 'Fortaleza', 1),
('Patricia Gomes', '2002-04-28', 'RG100012', 'CPF100012', 'Maracanaú', 1),
('André Luiz Ribeiro', '2001-09-12', 'RG100013', 'CPF100013', 'Maranguape', 1),
('Beatriz Fernandes', '2004-11-21', 'RG100014', 'CPF100014', 'Fortaleza', 0),
('Diego Nascimento', '1999-07-07', 'RG100015', 'CPF100015', 'Caucaia', 1),
('Larissa Monteiro', '2003-03-19', 'RG100016', 'CPF100016', 'Maracanaú', 1),
('Felipe Barbosa', '2000-12-02', 'RG100017', 'CPF100017', 'Pacatuba', 1),
('Amanda Pereira', '2002-08-16', 'RG100018', 'CPF100018', 'Fortaleza', 0),
('Gustavo Moreira', '2001-01-24', 'RG100019', 'CPF100019', 'Maranguape', 1),
('Renata Cardoso', '2003-05-11', 'RG100020', 'CPF100020', 'Maracanaú', 1);

use agenda_bd;
INSERT INTO contatos (nome, telefone, email, cidade)
VALUES
('Ana Paula Silva', '85998765432', 'ana.silva@gmail.com', 'Fortaleza'),
('Carlos Eduardo Lima', '85991234567', 'carlos.lima@gmail.com', 'Maracanaú'),
('Maria Fernanda Souza', '85999887766', 'maria.souza@gmail.com', 'Caucaia'),
('João Pedro Oliveira', '85997654321', 'joao.oliveira@gmail.com', 'Fortaleza'),
('Juliana Costa', '85996543210', 'juliana.costa@gmail.com', 'Pacatuba'),
('Roberto Almeida', '85995432109', 'roberto.almeida@gmail.com', 'Maranguape'),
('Patricia Gomes', '85994321098', 'patricia.gomes@gmail.com', 'Fortaleza'),
('Fernando Rocha', '85993210987', 'fernando.rocha@gmail.com', 'Eusébio'),
('Camila Martins', '85992109876', 'camila.martins@gmail.com', 'Aquiraz'),
('Ricardo Ferreira', '85991098765', 'ricardo.ferreira@gmail.com', 'Caucaia'),
('Beatriz Nascimento', '85998987654', 'beatriz.nascimento@gmail.com', 'Fortaleza'),
('Lucas Ribeiro', '85997876543', 'lucas.ribeiro@gmail.com', 'Maracanaú'),
('Amanda Carvalho', '85996765432', 'amanda.carvalho@gmail.com', 'Pacajus'),
('Felipe Barbosa', '85995654321', 'felipe.barbosa@gmail.com', 'Horizonte'),
('Larissa Mendes', '85994543210', 'larissa.mendes@gmail.com', 'Fortaleza'),
('Gabriel Teixeira', '85993432109', 'gabriel.teixeira@gmail.com', 'Itaitinga'),
('Renata Castro', '85992321098', 'renata.castro@gmail.com', 'Maracanaú'),
('Daniel Moreira', '85991210987', 'daniel.moreira@gmail.com', 'Caucaia'),
('Vanessa Araújo', '85999109876', 'vanessa.araujo@gmail.com', 'Fortaleza'),
('André Pereira', '85998098765', 'andre.pereira@gmail.com', 'Maranguape');

INSERT INTO usuarios (nome, email, senha)
VALUES
('Ana Paula Silva', 'ana.silva@gmail.com', '123456'),
('Carlos Eduardo Lima', 'carlos.lima@gmail.com', '123456'),
('Maria Fernanda Souza', 'maria.souza@gmail.com', '123456'),
('João Pedro Oliveira', 'joao.oliveira@gmail.com', '123456'),
('Juliana Costa', 'juliana.costa@gmail.com', '123456'),
('Roberto Almeida', 'roberto.almeida@gmail.com', '123456'),
('Patricia Gomes', 'patricia.gomes@gmail.com', '123456'),
('Fernando Rocha', 'fernando.rocha@gmail.com', '123456'),
('Camila Martins', 'camila.martins@gmail.com', '123456'),
('Ricardo Ferreira', 'ricardo.ferreira@gmail.com', '123456'),
('Beatriz Nascimento', 'beatriz.nascimento@gmail.com', '123456'),
('Lucas Ribeiro', 'lucas.ribeiro@gmail.com', '123456'),
('Amanda Carvalho', 'amanda.carvalho@gmail.com', '123456'),
('Felipe Barbosa', 'felipe.barbosa@gmail.com', '123456'),
('Larissa Mendes', 'larissa.mendes@gmail.com', '123456'),
('Gabriel Teixeira', 'gabriel.teixeira@gmail.com', '123456'),
('Renata Castro', 'renata.castro@gmail.com', '123456'),
('Daniel Moreira', 'daniel.moreira@gmail.com', '123456'),
('Vanessa Araújo', 'vanessa.araujo@gmail.com', '123456'),
('André Pereira', 'andre.pereira@gmail.com', '123456');
