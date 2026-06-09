--  1.
DROP TABLE gerente;

-- 2.
DROP TABLE funcao;

-- 3.
ALTER TABLE desenvolvedor ADD dataAdmissao DATE NOT NULL;

-- 4.
ALTER TABLE desenvolvedor MODIFY dataNascimento DATE NOT NULL;

-- 5.
ALTER TABLE areaNegocio MODIFY idArea INT NOT NULL AUTO_INCREMENT;
ALTER TABLE desenvolvedor MODIFY idDesenvolvedor INT NOT NULL AUTO_INCREMENT;
ALTER TABLE projetos MODIFY idProjeto INT NOT NULL AUTO_INCREMENT;
ALTER TABLE projetos MODIFY idGerente INT NOT NULL;
ALTER TABLE projetos MODIFY idArea INT NOT NULL;
ALTER TABLE projeto_desenvolvedor MODIFY id_projeto_desenvolvedor INT NOT NULL AUTO_INCREMENT;
ALTER TABLE projeto_desenvolvedor MODIFY idProjeto INT NOT NULL;
ALTER TABLE projeto_desenvolvedor MODIFY idDesenvolvedor INT NOT NULL;

-- 6.
ALTER TABLE projeto MODIFY breveDescricao VARCHAR(100) NOT NULL;

-- 7 e 8.
ALTER TABLE desenvolvedor MODIFY telefone VARCHAR(11) NOT NULL;

-- 9.
ALTER TABLE projetos MODIFY dataFimEstimada DATE NOT NULL;
ALTER TABLE projetos MODIFY custoAproximado FLOAT NOT NULL;


-- Consulta com JOIN

SELECT p.breveDescricao AS "Descricao Projeto",
p.statusDesenvolvimento AS "Status de Desenvolvimento",
an.descricao AS "Dascricao Area"
FROM projetos AS p
JOIN areaNegocio AS an
ON p.idArea = an.idArea;


-- Consulta com JOIN em 3 tabelas

SELECT d.nome AS "Desenvolvedor",
pd.funcao AS "Funcao",
p.breveDescricao AS "Projeto"
FROM projetos AS p
JOIN projeto_desenvolvedor AS pd ON p.idProjeto = pd.idProjeto
JOIN desenvolvedor AS d ON pd.idDesenvolvedor = d.idDesenvolvedor;
