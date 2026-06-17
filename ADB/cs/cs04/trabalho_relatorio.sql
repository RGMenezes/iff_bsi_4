
-- Relatório que nos mostra os alunos que mais treinaram
SELECT u.nome AS aluno,
CASE
  WHEN s.duracao_seg IS NULL THEN 0
  ELSE SUM(s.duracao_seg)
END AS total
FROM usuario AS u
JOIN atribuicao AS a ON a.aluno_id = u.id
LEFT JOIN sessao AS s ON s.atribuicao_id = a.id
GROUP BY u.id, u.nome
ORDER BY total DESC;


-- Relatório que nos mostra os alunos de cada professor com nome e status das fichas
SELECT up.nome AS professor,
ft.nome AS ficha,
ua.nome AS aluno,
CASE
  WHEN ft.ativo = 1 THEN 'ATIVO'
  ELSE 'INATIVO'
END AS 'status'
FROM usuario AS up
JOIN ficha_treino AS ft ON ft.professor_id = up.id
JOIN atribuicao AS a ON a.ficha_id = ft.id
JOIN usuario AS ua ON a.aluno_id = ua.id;


-- Relatório que nos mostra os alunos que treinaram acima da média
SELECT u.nome AS aluno,
CASE
  WHEN s.duracao_seg IS NULL THEN 0
  ELSE SUM(s.duracao_seg)
END AS total,
(
  SELECT AVG(duracao_seg)
  FROM sessao
) AS media
FROM usuario AS u
JOIN atribuicao AS a ON a.aluno_id = u.id
LEFT JOIN sessao AS s ON s.atribuicao_id = a.id
GROUP BY u.id, u.nome
HAVING SUM(s.duracao_seg) > media
ORDER BY total DESC;


-- Relatório que nos mostra a média de tempo de descanso por ficha de treino
SELECT
  ft.id AS ficha_id,
  ft.nome AS ficha_nome,
  AVG(s.descanso_seg) AS media_descanso_seg
FROM ficha_treino ft
JOIN bloco AS b ON b.ficha_id = ft.id
JOIN serie AS s ON s.bloco_id = b.id
GROUP BY ft.id, ft.nome
ORDER BY ft.nome;


-- Relatório que nos mostra a quantidade de alunos por professor
SELECT
  up.nome AS professor,
  COUNT(DISTINCT a.aluno_id) AS total_alunos
FROM usuario AS up
JOIN professor AS p ON p.usuario_id = up.id
JOIN ficha_treino AS ft ON ft.professor_id = p.usuario_id
JOIN atribuicao AS a ON a.ficha_id = ft.id
GROUP BY up.id, up.nome
ORDER BY total_alunos DESC;
