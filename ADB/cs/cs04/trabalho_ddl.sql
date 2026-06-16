CREATE DATABASE training_timer_db;

USE training_timer_db;


CREATE TABLE usuario (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  ativo BOOLEAN NOT NULL
);

CREATE TABLE professor (
  usuario_id BIGINT PRIMARY KEY,

  CONSTRAINT fk_professor_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE aluno (
  usuario_id BIGINT PRIMARY KEY,

  CONSTRAINT fk_aluno_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE ficha_treino (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  criado_em DATETIME NOT NULL,
  ativo BOOLEAN NOT NULL,

  professor_id BIGINT NOT NULL,

  CONSTRAINT fk_ficha_treino_professor
    FOREIGN KEY (professor_id)
    REFERENCES professor(usuario_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE bloco (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  ordem INT NOT NULL,

  ficha_id BIGINT NOT NULL,

  CONSTRAINT fk_bloco_ficha_treino
    FOREIGN KEY (ficha_id)
    REFERENCES ficha_treino(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE serie (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,

  nome_exercicio VARCHAR(100) NOT NULL,
  tipo ENUM('TEMPO', 'REPETICOES') NOT NULL,
  valor INT NOT NULL,
  descanso_seg INT NOT NULL,
  ordem INT NOT NULL,

  bloco_id BIGINT NOT NULL,

  CONSTRAINT fk_serie_bloco
    FOREIGN KEY (bloco_id)
    REFERENCES bloco(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE atribuicao (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,

  data_inicio DATE NOT NULL,
  data_fim DATE NULL,

  ficha_id BIGINT NOT NULL,
  aluno_id BIGINT NOT NULL,

  CONSTRAINT fk_atribuicao_ficha_treino
    FOREIGN KEY (ficha_id)
    REFERENCES ficha_treino(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,

  CONSTRAINT fk_atribuicao_aluno
    FOREIGN KEY (aluno_id)
    REFERENCES aluno(usuario_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE sessao (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,

  iniciado_em DATETIME NOT NULL,
  duracao_seg INT NOT NULL,

  status ENUM('COMPLETA', 'INTERROMPIDA') NOT NULL,

  atribuicao_id BIGINT NOT NULL,

  CONSTRAINT fk_sessao_atribuicao
    FOREIGN KEY (atribuicao_id)
    REFERENCES atribuicao(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE meta (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,

  descricao TEXT NOT NULL,
  status ENUM('EM_PROGRESSO', 'ATINGIDA') NOT NULL,

  nome_exercicio VARCHAR(100) NULL,

  aluno_id BIGINT NOT NULL,
  professor_id BIGINT NOT NULL,
  ficha_id BIGINT NULL,

  CONSTRAINT fk_meta_aluno
    FOREIGN KEY (aluno_id)
    REFERENCES aluno(usuario_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,

  CONSTRAINT fk_meta_professor
    FOREIGN KEY (professor_id)
    REFERENCES professor(usuario_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,

  CONSTRAINT fk_meta_ficha_treino
    FOREIGN KEY (ficha_id)
    REFERENCES ficha_treino(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);
