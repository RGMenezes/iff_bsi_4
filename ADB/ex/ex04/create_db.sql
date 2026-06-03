CREATE DATABASE db_imobiliaria;

USE db_imobiliaria;


CREATE TABLE corretor (
  id_corretor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL
);

CREATE TABLE endereco (
  id_endereco INT AUTO_INCREMENT PRIMARY KEY,
  rua VARCHAR(255) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  complemento VARCHAR(10) NOT NULL
);

CREATE TABLE imovel (
  id_imovel INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(255) NOT NULL,
  area INT NOT NULL,
  preco FLOAT NOT NULL,
  tipo ENUM('Casa', 'Apartamento', 'Terreno') NOT NULL,
  dtCadastro DATE NOT NULL,

  id_endereco INT,
  id_corretor INT NOT NULL,
  FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
  ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (id_corretor) REFERENCES corretor(id_corretor)
  ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  data DATE NOT NULL,
  hora TIME NOT NULL,

  id_cliente INT NOT NULL,
  id_imovel INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel)
  ON DELETE CASCADE ON UPDATE CASCADE
);
