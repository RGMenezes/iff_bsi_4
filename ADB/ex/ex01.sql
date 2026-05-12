-- create database db_exemplo;

-- use db_exemplo;

-- create table CREATE TABLE departamento (
--     departamentoID int not null auto_increment primary key,
--     nome varchar(30)
-- );

-- CREATE TABLE empregado (
--     matricula char(4) not null primary key,
--     nome varchar(80) not null,
--     data_nasc DATE,
--     logradouro varchar(100),
--     cidade varchar(40),
--     uf char(2) ,
--     salario dec,
--     departamento int not null references departamento(departamentoID)
-- );

-- INSERT INTO departamento (departamento_ID, nome)
-- values (1,’Financeiro’);


create database db_imobiliaria;

use db_imobiliaria;

create table imovel (
    idImovel int not null auto_increment primary key,
    descricao varchar(80) not null,
    tipo int not null default 1,
    area float,
    proprietario int,
    preco float,
    dataCadastro date,
    foreign key (tipo) references tipo(idTipo) 
    foreign key (proprietario) references proprietario(idProprietario) 
);