CREATE USER 'admin'@'localhost' IDENTIFIED BY '@admin123';
GRANT ALL ON *.* TO 'admin'@'localhost';

CREATE USER 'table'@'localhost' IDENTIFIED BY '@table123';
GRANT ALL ON training_timer_db.ficha_treino TO 'table'@'localhost';
GRANT ALL ON training_timer_db.bloco TO 'table'@'localhost';
GRANT ALL ON training_timer_db.serie TO 'table'@'localhost';

CREATE USER 'column'@'localhost' IDENTIFIED BY '@column123';
GRANT SELECT, UPDATE (descricao, status, nome_exercicio) ON training_timer_db.meta TO 'column'@'localhost';

CREATE USER 'select'@'localhost' IDENTIFIED BY '@select123';
GRANT SELECT ON training_timer_db.* TO 'select'@'localhost';

CREATE USER 'revoke'@'localhost' IDENTIFIED BY '@revoke123';
GRANT ALL ON training_timer_db.* TO 'revoke'@'localhost';
REVOKE DROP ON training_timer_db.* FROM 'revoke'@'localhost';

FLUSH PRIVILEGES;
