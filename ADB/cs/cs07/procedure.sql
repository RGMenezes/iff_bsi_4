DELIMITER $$

CREATE PROCEDURE sp_registrar_sessao(
    IN p_aluno_id BIGINT,
    IN p_atribuicao_id BIGINT,
    IN p_duracao_seg INT,
    IN p_status VARCHAR(20)
)
BEGIN
    DECLARE v_aluno_id BIGINT;
    DECLARE v_ficha_id BIGINT;
    DECLARE v_aluno_ativo BOOLEAN;
    DECLARE v_ficha_ativa BOOLEAN;

    SELECT
        a.aluno_id,
        a.ficha_id,
        u.ativo,
        ft.ativo
    INTO
        v_aluno_id,
        v_ficha_id,
        v_aluno_ativo,
        v_ficha_ativa
    FROM atribuicao AS a
    INNER JOIN usuario AS u
        ON u.id = a.aluno_id
    INNER JOIN ficha_treino AS ft
        ON ft.id = a.ficha_id
    WHERE a.id = p_atribuicao_id;

    IF v_aluno_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Atribuicao nao encontrada.';
    END IF;

    IF v_aluno_id <> p_aluno_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A atribuicao nao pertence ao aluno informado.';
    END IF;

    IF v_aluno_ativo = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aluno inativo.';
    END IF;

    IF v_ficha_ativa = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ficha de treino inativa.';
    END IF;

    IF p_duracao_seg <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A duracao da sessao deve ser maior que zero.';
    END IF;

    IF p_status NOT IN ('COMPLETA', 'INTERROMPIDA') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Status da sessao invalido.';
    END IF;

    INSERT INTO sessao (
        iniciado_em,
        duracao_seg,
        status,
        atribuicao_id
    )
    VALUES (
        NOW(),
        p_duracao_seg,
        p_status,
        p_atribuicao_id
    );
END$$

DELIMITER ;


-- Comando de Teste da procedure
CALL sp_registrar_sessao(3, 1, 3000, 'COMPLETA');
