
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
