SELECT * FROM endereco;
SELECT * FROM imovel;

DELETE FROM endereco WHERE id_endereco = 3;

SELECT * FROM endereco;
SELECT * FROM imovel;


--


SELECT * FROM corretor;
SELECT * FROM imovel;

DELETE FROM corretor WHERE id_corretor = 3;

SELECT * FROM corretor;
SELECT * FROM imovel;


--


SELECT * FROM imovel;
SELECT * FROM reserva;

DELETE FROM imovel WHERE id_imovel = 3;

SELECT * FROM imovel;
SELECT * FROM reserva;


--


SELECT * FROM cliente;
SELECT * FROM reserva;

DELETE FROM cliente WHERE id_cliente = 3;

SELECT * FROM cliente;
SELECT * FROM reserva;
