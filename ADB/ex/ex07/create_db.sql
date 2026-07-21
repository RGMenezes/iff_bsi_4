CREATE DATABASE db_oficina;

USE db_oficina;

CREATE TABLE proprietario (
  idProprietario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  dtNasc DATE NOT NULL,
  telefone VARCHAR(15) NOT NULL
);

CREATE TABLE veiculo (
  idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(30) NOT NULL,
  ano int NOT NULL,
  cor VARCHAR(30) NOT NULL,

  idProprietario INT NOT NULL,
  FOREIGN KEY (idProprietario) REFERENCES proprietario(idProprietario)
  ON DELETE CASCADE ON UPDATE CASCADE
);


ALTER TABLE veiculo ADD INDEX index_IdProprietario (idProprietario);
