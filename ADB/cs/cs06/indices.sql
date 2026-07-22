--Otimização de Busca de Fichas Vigentes do Aluno (Atribuições)
CREATE INDEX idx_atribuicao_aluno_vigencia
ON atribuicao (aluno_id, data_inicio, data_fim);

-- Otimização de Histórico e Filtro de Sessões
CREATE INDEX idx_sessao_atribuicao_data
ON sessao (atribuicao_id, iniciado_em);

-- Otimização de Consulta de Metas do Aluno
CREATE INDEX idx_meta_aluno_status
ON meta (aluno_id, status);

-- Otimização de Busca de Blocos por Ficha de Treino
CREATE INDEX idx_bloco_ficha
ON bloco (ficha_id, ordem);
