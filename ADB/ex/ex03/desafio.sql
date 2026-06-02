-- Desafio 1
SELECT v.nome, p.descricao
FROM vendedor as v
JOIN venda as s ON v.id_vendedor = s.id_vendedor
JOIN item_venda as iv ON s.id_venda = iv.id_venda
JOIN produto as p ON iv.id_produto = p.id_produto
ORDER BY v.nome DESC;


-- Desafio 2
SELECT v.nome, p.descricao, COUNT(*) as quantidade
FROM vendedor as v
JOIN venda as s ON v.id_vendedor = s.id_vendedor
JOIN item_venda as iv ON s.id_venda = iv.id_venda
JOIN produto as p ON iv.id_produto = p.id_produto
GROUP BY v.nome, p.descricao
ORDER BY quantidade DESC;


-- Desafio 3
SELECT v.nome, p.descricao
FROM vendedor as v
RIGHT JOIN venda as s ON v.id_vendedor = s.id_vendedor
RIGHT JOIN item_venda as iv ON s.id_venda = iv.id_venda
RIGHT JOIN produto as p ON iv.id_produto = p.id_produto
ORDER BY v.nome DESC;

-- Desafio 4
SELECT f.descricao, c.nome
FROM fabricante as f
JOIN produto as p ON f.id_fabricante = p.id_fabricante
JOIN item_venda as iv ON p.id_produto = iv.id_produto
JOIN venda as v ON iv.id_venda = v.id_venda
JOIN cliente as c ON v.id_cliente = c.id_cliente;
