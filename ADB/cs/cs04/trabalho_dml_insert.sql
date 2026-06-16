-- USUÁRIOS

INSERT INTO usuario (nome, email, senha_hash, ativo) VALUES
('Carlos Silva', 'carlos@ifftreinador.com', 'hash123', TRUE),
('Fernanda Souza', 'fernanda@ifftreinador.com', 'hash123', TRUE),

('Joao Pereira', 'joao@email.com', 'hash123', TRUE),
('Maria Oliveira', 'maria@email.com', 'hash123', TRUE),
('Pedro Santos', 'pedro@email.com', 'hash123', TRUE),
('Ana Costa', 'ana@email.com', 'hash123', TRUE),
('Lucas Rocha', 'lucas@email.com', 'hash123', TRUE),
('Julia Martins', 'julia@email.com', 'hash123', FALSE);

-- PROFESSORES

INSERT INTO professor (usuario_id) VALUES
(1),
(2);

-- ALUNOS

INSERT INTO aluno (usuario_id) VALUES
(3),
(4),
(5),
(6),
(7),
(8);

-- FICHAS

INSERT INTO ficha_treino
(nome, criado_em, ativo, professor_id)
VALUES
('Hipertrofia A', NOW(), TRUE, 1),
('Hipertrofia B', NOW(), TRUE, 1),
('Emagrecimento', NOW(), TRUE, 2),
('Condicionamento', NOW(), FALSE, 2);

-- BLOCOS

INSERT INTO bloco (nome, ordem, ficha_id) VALUES
('Aquecimento', 1, 1),
('Peitoral', 2, 1),

('Aquecimento', 1, 2),
('Costas', 2, 2),

('Cardio', 1, 3),
('Circuito', 2, 3),

('Aerobico', 1, 4);

-- SÉRIES

INSERT INTO serie
(nome_exercicio, tipo, valor, descanso_seg, ordem, bloco_id)
VALUES

('Esteira', 'TEMPO', 300, 30, 1, 1),
('Polichinelo', 'REPETICOES', 30, 20, 2, 1),

('Supino Reto', 'REPETICOES', 12, 60, 1, 2),
('Crucifixo', 'REPETICOES', 15, 45, 2, 2),

('Corrida Leve', 'TEMPO', 240, 30, 1, 3),

('Puxada Frontal', 'REPETICOES', 12, 60, 1, 4),
('Remada Baixa', 'REPETICOES', 12, 60, 2, 4),

('Bicicleta', 'TEMPO', 900, 60, 1, 5),

('Burpees', 'REPETICOES', 15, 30, 1, 6),
('Agachamento', 'REPETICOES', 20, 30, 2, 6),

('Caminhada', 'TEMPO', 1200, 60, 1, 7);

-- ATRIBUIÇÕES

INSERT INTO atribuicao
(data_inicio, data_fim, ficha_id, aluno_id)
VALUES

('2026-06-01', NULL, 1, 3),
('2026-06-01', NULL, 2, 3),

('2026-06-01', NULL, 1, 4),

('2026-05-01', '2026-05-31', 3, 5),

('2026-06-01', NULL, 3, 6),

('2026-06-10', NULL, 2, 7),

('2026-05-01', NULL, 1, 8);

-- SESSÕES

INSERT INTO sessao
(iniciado_em, duracao_seg, status, atribuicao_id)
VALUES

('2026-06-05 08:00:00', 2800, 'COMPLETA', 1),
('2026-06-07 08:10:00', 2700, 'COMPLETA', 1),
('2026-06-09 08:15:00', 1200, 'INTERROMPIDA', 1),

('2026-06-08 18:00:00', 2600, 'COMPLETA', 2),

('2026-06-06 07:00:00', 2900, 'COMPLETA', 3),

('2026-05-20 19:00:00', 3200, 'COMPLETA', 4),

('2026-06-12 17:30:00', 1800, 'INTERROMPIDA', 5),

('2026-06-13 18:00:00', 2500, 'COMPLETA', 6);

-- METAS

INSERT INTO meta
(descricao, status, nome_exercicio,
 aluno_id, professor_id, ficha_id)
VALUES

(
 'Completar 10 sessoes da ficha Hipertrofia A',
 'EM_PROGRESSO',
 NULL,
 3,
 1,
 1
),

(
 'Executar Supino Reto com tecnica correta',
 'EM_PROGRESSO',
 'Supino Reto',
 4,
 1,
 NULL
),

(
 'Perder 3kg ate o final do mes',
 'ATINGIDA',
 NULL,
 5,
 2,
 3
),

(
 'Completar treino sem interrupcoes',
 'EM_PROGRESSO',
 NULL,
 6,
 2,
 3
),

(
 'Realizar 20 burpees consecutivos',
 'ATINGIDA',
 'Burpees',
 7,
 1,
 NULL
);

-- CASE WHEN

UPDATE meta
SET status =
  CASE
    WHEN aluno_id IN (3, 7)
      THEN 'ATINGIDA'

    WHEN aluno_id IN (4, 5, 6)
      THEN 'EM_PROGRESSO'

    ELSE status
  END
WHERE aluno_id IN (3, 4, 5, 6, 7);
