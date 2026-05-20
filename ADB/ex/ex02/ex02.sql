SELECT ci.descricao, count(cl.id_cliente) AS populacao
FROM cidade ci
JOIN cliente cl
ON ci.id_cidade = cl.id_cidade
GROUP BY cl.id_cidade;

SELECT cl.nome, ci.descricao
FROM cliente cl
LEFT JOIN cidade ci
ON cl.id_cidade = ci.id_cidade;