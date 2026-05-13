-- Exercício 01

select nome, pontos_prog_fidelidade from cliente
where pontos_prog_fidelidade > 0
order by pontos_prog_fidelidade desc;


-- Exercício 02 (0 mulher, 1 homem)

select genero, avg(pontos_prog_fidelidade) from cliente
group by genero;


-- Exercício 03

select ano_cadastro, count(*) from cliente
group by ano_cadastro;


-- Exercício 04

select count(*) from cliente
where ano_cadastro between 2005 and 2010;


-- Exercício 05

select id_fabricante, count(*) from produto
group by id_fabricante;


-- Exercício 06

select id_venda, count(*) from item_venda
group by id_venda;


-- Exercício 07

select percentual_comissao from vendedor
group by percentual_comissao;


-- Exercício 08

select id_fabricante from produto
group by id_fabricante;


-- Exercício 09

select descricao, qtde_estoque from produto
order by qtde_estoque desc;


-- Exercício 10

select nome, genero from vendedor
where genero = 0;


-- Exercício 11

select nome, genero, salario from vendedor
where genero = 0 and salario > 1500;


-- Exercício 12

select concat("O produto ", descricao, " possui ", qtde_estoque, " unidades em estoque") as Descricao
from produto
where valor > 100;