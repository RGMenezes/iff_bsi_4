-- 1
SELECT nome
FROM cliente AS c
JOIN venda AS v
ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente;

-- 2
SELECT count(*) AS total_vendas, vf.nome
FROM venda AS v
JOIN vendedor AS vf
ON v.id_vendedor = vf.id_vendedor
GROUP BY v.id_vendedor, vf.nome
ORDER BY total_vendas DESC;

-- 3
SELECT count(*) AS total_vendas, vf.nome
FROM venda AS v
JOIN vendedor AS vf
ON v.id_vendedor = vf.id_vendedor
GROUP BY v.id_vendedor, vf.nome
ORDER BY total_vendas DESC
LIMIT 1;

-- 4
SELECT p.descricao AS produto, f.descricao AS fabricante
FROM produto AS p
JOIN fabricante AS f
ON p.id_fabricante = f.id_fabricante;

-- 5
SELECT c.nome as cliente
FROM cliente AS c
JOIN venda AS v
ON v.id_cliente = c.id_cliente
WHERE v.ano = 2011
GROUP BY c.id_cliente;

-- 6
SELECT vf.nome AS vendedor,
v.mes AS mes,
v.ano AS ano,
iv.qtde AS quantidade,
p.descricao AS produto,
f.descricao AS fabricante
FROM vendedor AS vf
LEFT JOIN venda AS v
ON vf.id_vendedor = v.id_vendedor
LEFT JOIN item_venda AS iv
ON v.id_venda = iv.id_venda
LEFT JOIN produto AS p
ON iv.id_produto = p.id_produto
LEFT JOIN fabricante AS f
ON p.id_fabricante = f.id_fabricante;

-- 7
SELECT vf.nome AS vendedor, cd.descricao
FROM vendedor AS vf
LEFT JOIN cidade AS cd
ON vf.id_cidade = cd.id_cidade;

-- 8
SELECT cd.descricao AS cidade, count(*) AS total_clientes
FROM cidade AS cd
LEFT JOIN cliente AS c
ON cd.id_cidade = c.id_cidade
GROUP BY cd.id_cidade, cd.descricao
ORDER BY total_clientes DESC;

-- 9
SELECT p.descricao AS produto, p.id_produto AS id
FROM produto AS p
ORDER BY p.valor ASC
LIMIT 1;


-- 10
SELECT p.descricao AS produto, p.id_produto AS id
FROM produto AS p
WHERE p.valor > (SELECT AVG(valor) FROM produto)
ORDER BY p.valor DESC;
