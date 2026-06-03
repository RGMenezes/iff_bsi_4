USE db_imobiliaria;

INSERT INTO corretor (nome, cpf) VALUES
('Ana Silva', '123.456.789-00'),
('Bruno Costa', '234.567.890-11'),
('Camila Rocha', '345.678.901-22'),
('Diego Santos', '456.789.012-33'),
('Elisa Martins', '567.890.123-44');

INSERT INTO cliente (nome, telefone) VALUES
('Lucas Pereira', '(11) 98888-7777'),
('Mariana Lima', '(21) 97777-6666'),
('Ricardo Alves', '(31) 96666-5555'),
('Patrícia Nunes', '(41) 95555-4444'),
('Thiago Ferreira', '(51) 94444-3333');

INSERT INTO endereco (rua, estado, cidade, bairro, complemento) VALUES
('Rua das Acácias, 100', 'SP', 'São Paulo', 'Jardim das Flores', 'Apto 101'),
('Avenida Central, 250', 'RJ', 'Rio de Janeiro', 'Centro', 'Sala 02'),
('Rua das Palmeiras, 57', 'MG', 'Belo Horizonte', 'Savassi', 'Casa'),
('Rua do Comércio, 80', 'PR', 'Curitiba', 'Batel', 'Bloco B'),
('Rua do Sol, 12', 'BA', 'Salvador', 'Barra', 'Cobertura');

INSERT INTO imovel (descricao, area, preco, tipo, dtCadastro, id_endereco, id_corretor) VALUES
('Casa térrea com quintal e churrasqueira', 180, 750000.00, 'Casa', '2026-01-15', 1, 1),
('Apartamento moderno com 3 quartos e varanda', 110, 620000.00, 'Apartamento', '2026-02-02', 2, 2),
('Terreno residencial em bairro valorizado', 450, 320000.00, 'Terreno', '2026-03-12', 3, 3),
('Sobrado com suíte e garagem para 2 carros', 210, 920000.00, 'Casa', '2026-03-27', 4, 1),
('Apartamento compacto próximo ao metrô', 65, 350000.00, 'Apartamento', '2026-04-08', 5, 4);

INSERT INTO reserva (data, hora, id_cliente, id_imovel) VALUES
('2026-04-10', '10:00:00', 1, 1),
('2026-04-15', '14:30:00', 2, 2),
('2026-04-18', '09:00:00', 3, 3),
('2026-04-20', '16:00:00', 4, 4),
('2026-04-25', '11:30:00', 5, 5);
