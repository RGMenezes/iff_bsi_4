DELIMITER $$

CREATE TRIGGER trg_verificar_meta_sessao
AFTER INSERT ON sessao
FOR EACH ROW
BEGIN
    DECLARE v_aluno_id BIGINT;
    DECLARE v_ficha_id BIGINT;
    DECLARE v_total_sessoes INT;

    IF NEW.status = 'COMPLETA' THEN

        SELECT
            a.aluno_id,
            a.ficha_id
        INTO
            v_aluno_id,
            v_ficha_id
        FROM atribuicao AS a
        WHERE a.id = NEW.atribuicao_id;

        SET v_total_sessoes =
            fn_total_sessoes_completas(
                v_aluno_id,
                v_ficha_id
            );

        IF v_total_sessoes >= 3 THEN

            UPDATE meta
            SET status = 'ATINGIDA'
            WHERE aluno_id = v_aluno_id
              AND ficha_id = v_ficha_id
              AND status = 'EM_PROGRESSO';

        END IF;

    END IF;
END$$

DELIMITER ;
