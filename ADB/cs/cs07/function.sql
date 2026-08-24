DELIMITER $$

CREATE FUNCTION fn_total_sessoes_completas(
    p_aluno_id BIGINT,
    p_ficha_id BIGINT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*)
    INTO v_total
    FROM sessao AS s
    INNER JOIN atribuicao AS a
        ON a.id = s.atribuicao_id
    WHERE a.aluno_id = p_aluno_id
      AND a.ficha_id = p_ficha_id
      AND s.status = 'COMPLETA';

    RETURN v_total;
END$$

DELIMITER ;


-- Comando de Teste da função
SELECT fn_total_sessoes_completas(3, 1);
