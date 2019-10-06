-- Cria o banco de dados
CREATE DATABASE `Paciente`;

-- Ativa o banco de dados
USE `Paciente`;

-- Cria a tabela Paciente
CREATE TABLE `paciente` (
  `cpf` varchar(11) NOT NULL,
  `nome_paciente` varchar(100) NOT NULL,
  `data_da_consulta` DATE NOT NULL,
  PRIMARY KEY (`cpf`)
);

-- Cria a tabela Médico
CREATE TABLE `medico` (
  `crm` varchar(11) NOT NULL,
  `nome_medico` varchar(50) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`crm`) 
);

-- Cria a tabela Consulta -> Que relaciona a tabela paciente com a médico sendo a cardinalidade muitos para muitos!
CREATE TABLE `consulta` (
  `cpf_da_consulta` varchar(11) NOT NULL,
  `crm_da_consulta` varchar(11) NOT NULL,
  FOREIGN KEY (`cpf_da_consulta`) REFERENCES `paciente` (`cpf`),
  FOREIGN KEY (`crm_da_consulta`) REFERENCES `medico` (`crm`)
  );
  
-- Inserção de dados!
INSERT INTO `paciente` (`cpf`, `nome_paciente`, `data_da_consulta`) VALUES ('11122234569', 'Cassio Bueno', '2019-05-01'), 
('54329964045', 'Ana Sagrado', '2019-03-03');

INSERT INTO `medico` (`crm`, `nome_medico`, `especialidade`) VALUES ('52-83199-9','Paulo Vaz', 'Clinico Geral'),
('60-83199-9', 'Caio Gabriel','Cardiaco');

INSERT INTO `medico` (`crm`, `nome_medico`, `especialidade`) VALUES ('52-89443-9','Sabrina Borges', 'Emergências'),
('60-01010-9', 'Grabriel Pessoa','Respiratorio');

INSERT INTO `consulta` (`cpf_da_consulta`, `crm_da_consulta`) VALUES ('11122234569', '52-83199-9'),
('54329964045', '60-83199-9');

-- Consultar todos os campos das tabelas em que o médico realizou uma consulta com algum paciente!
select p.cpf as 'Cpf Cliente' , p.nome_paciente as 'Nome cliente' , p.data_da_consulta as 'Data Cliente',
m.crm as 'Crm Médico', m.nome_medico as 'Nome Médico' ,  m.especialidade as 'Especialidade Médico'
from paciente p join consulta c on p.cpf = c.cpf_da_consulta join medico m on m.crm = c.crm_da_consulta;

-- Consultar todos os campos das tabelas em que o médico realizou uma consulta com algum paciente ou não!
select p.nome_paciente as 'Nome cliente' , p.data_da_consulta as 'Data Cliente',
m.nome_medico as 'Nome Médico' ,  m.especialidade as 'Especialidade Médico'
from paciente p join consulta c on p.cpf = c.cpf_da_consulta right join medico m on m.crm = c.crm_da_consulta;