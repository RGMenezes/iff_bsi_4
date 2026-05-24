# Sistema de Gestão de Projetos de Pesquisa
## Documento de Requisitos

---

## Descrição do Contexto

O sistema deve possibilitar o cadastro do tipo de bolsa de acordo com as modalidades definidas no edital.

O sistema deve possibilitar o cadastro de núcleo com as seguintes informações: nome, sigla e link do grupo de pesquisa do CNPq. Incluir na frente do campo link o endereço de consulta das áreas do CNPq (mesmo procedimento em projetos).

O sistema deve possibilitar o cadastro de avaliador com as seguintes informações: nome e área de avaliação (campo texto).

O sistema deve possibilitar o cadastro de Edital com as seguintes informações: nome, arquivo do edital, data de início de submissão e data final de submissão. Ao cadastrar o Edital, o gestor poderá ou não publicar o edital. Publicar o edital é a ação de permitir que projetos sejam submetidos.

O sistema deve possibilitar o cadastro de pesquisador com as seguintes informações: núcleo (um ou dois núcleos), nome, CPF, data de nascimento, e-mail, telefone fixo, telefone celular, endereço (logradouro, número, complemento, CEP com busca no site dos Correios, município e estado), link do currículo Lattes, vínculo institucional (docente ou técnico administrativo), regime de trabalho (20h, 40h ou DE), campus de lotação, formação (especialista, mestre, doutor ou outros), área de conhecimento do CNPq, linha de pesquisa e área de conhecimento da pesquisa. O sistema deve permitir que o pesquisador realize um pré-cadastro, que deverá ser aprovado pelo Gestor. Ao aprovar o cadastro, deverá ser enviado um e-mail ao pesquisador de efetivação do cadastro.

O sistema deve possibilitar a submissão de projetos com as seguintes informações: tipo da bolsa, edital, núcleo (do pesquisador), situação do projeto (em edição, enviado, em avaliação, aprovado, reprovado e classificado), título do projeto, nome do coordenador do projeto (o pesquisador que estiver logado), se é renovação, no caso de renovação informar um breve relatório, data de submissão do projeto, equipe (nome, CPF, telefone, e-mail, tipo de pessoa — pesquisador ou aluno), resumo do projeto (250 palavras), arquivo do projeto, títulos dos projetos de pesquisa que atuou ou atua, encontros importantes da área e sugestão de nomes dos avaliadores.

Ao final, o pesquisador deve informar que está de acordo com os termos (termos a serem definidos = Lattes).

O sistema deve permitir que o projeto seja salvo para envio posterior (**em edição**) ou salvo e enviado imediatamente (**enviado**).

Após o envio do projeto, o Gestor deverá determinar o avaliador responsável (**em avaliação**) e, ao receber o parecer do avaliador, o Gestor deve registrar em forma textual o parecer e definir a situação final (aprovado classificado, reprovado ou aprovado não classificado), sendo enviado um e-mail ao coordenador do projeto com o parecer final.

> **OBS.:** O arquivo do projeto deve conter: Identificação, Revisão da Literatura, Caracterização do Problema, Justificativa, Objetivo, Metas, Metodologia, Estratégia de Ação, Cronograma Físico, Orçamento, Relevância e Impactos, Considerações Finais e Referências Bibliográficas.

**Situações possíveis do projeto:** Em Edição, Enviado, Em Avaliação, Aprovado Classificado, Aprovado Não Classificado e Reprovado.

---

## 1. Requisitos Funcionais (RF)

| ID | Descrição |
|----|-----------|
| RF01 | O sistema deve permitir o cadastro do tipo de bolsa conforme as modalidades do edital. |
| RF02 | O sistema deve permitir o cadastro de núcleo com nome, sigla e link do grupo de pesquisa no CNPq. |
| RF03 | O sistema deve apresentar, ao lado do campo "link do grupo de pesquisa", o endereço de consulta das áreas do CNPq (também nos projetos). |
| RF04 | O sistema deve permitir o cadastro de avaliador com nome e área de avaliação (campo texto). |
| RF05 | O sistema deve permitir o cadastro de edital com nome, arquivo, data de início e fim da submissão. |
| RF06 | O sistema deve permitir que o gestor publique ou não o edital após o cadastro. |
| RF07 | O sistema deve permitir o cadastro de pesquisadores com os seguintes dados: um ou dois núcleos; nome, CPF, data de nascimento; e-mail, telefones, endereço completo (com busca de CEP); link do currículo Lattes; vínculo institucional, regime de trabalho, campus; formação, área do conhecimento do CNPq, linha de pesquisa e área da pesquisa. |
| RF08 | O sistema deve permitir que o pesquisador realize um pré-cadastro. |
| RF09 | O sistema deve permitir que o gestor aprove o pré-cadastro de pesquisador. |
| RF10 | Após aprovação do cadastro, o sistema deve enviar e-mail de confirmação ao pesquisador. |
| RF11 | O sistema deve permitir a submissão de projetos com os seguintes dados: tipo da bolsa, edital vinculado, núcleo, situação do projeto, título, coordenador (pesquisador logado), se é renovação, relatório de renovação (se aplicável), data de submissão, equipe (nome, CPF, telefone, e-mail, tipo de pessoa), resumo (250 palavras), arquivo do projeto, títulos de projetos anteriores, encontros importantes da área, sugestões de avaliadores e confirmação dos termos. |
| RF12 | O sistema deve permitir salvar o projeto como "em edição" para envio posterior. |
| RF13 | O sistema deve permitir o envio imediato do projeto. |
| RF14 | O sistema deve permitir ao gestor indicar o avaliador do projeto. |
| RF15 | O sistema deve permitir ao gestor registrar o parecer textual do avaliador. |
| RF16 | O sistema deve permitir ao gestor definir a situação final do projeto (Aprovado Classificado, Aprovado Não Classificado, Reprovado). |
| RF17 | O sistema deve enviar e-mail com o parecer final ao coordenador do projeto. |
| RF18 | O sistema deve garantir que o arquivo de projeto contenha: Identificação, Revisão da Literatura, Caracterização do Problema, Justificativa, Objetivos, Metas, Metodologia, Estratégia de Ação, Cronograma, Orçamento, Relevância e Impactos, Considerações Finais e Referências. |

---

## 2. Requisitos Não Funcionais (RNF)

| ID | Descrição |
|----|-----------|
| RNF01 | O sistema deve ser acessível via web por navegadores modernos. |
| RNF02 | O sistema deve garantir segurança nos dados dos pesquisadores e projetos (criptografia em dados sensíveis). |
| RNF03 | O sistema deve ser compatível com dispositivos móveis. |
| RNF04 | O sistema deve ter boa usabilidade, com campos explicativos e mensagens de erro claras. |
| RNF05 | O sistema deve ser responsivo e apresentar desempenho aceitável (respostas em até 2 segundos). |
| RNF06 | O sistema deve enviar notificações por e-mail de forma automática nos eventos definidos. |
| RNF07 | O sistema deve incluir mecanismo de autenticação e controle de acesso por perfil (gestor, pesquisador, avaliador). |
| RNF08 | O sistema deve apresentar campo de ajuda no preenchimento do CEP com integração à busca dos Correios. |
| RNF09 | O sistema deve manter histórico das submissões e pareceres. |

---

## 3. Regras de Negócio (RN)

| ID | Descrição |
|----|-----------|
| RN01 | Somente projetos vinculados a editais publicados podem ser submetidos. |
| RN02 | O cadastro de pesquisador só se torna efetivo após a aprovação do gestor. |
| RN03 | O projeto pode ser submetido apenas se todos os campos obrigatórios forem preenchidos e o termo de compromisso for aceito. |
| RN04 | Um pesquisador pode estar vinculado a no máximo dois núcleos. |
| RN05 | O projeto pode estar em apenas uma das seguintes situações: Em Edição, Enviado, Em Avaliação, Aprovado Classificado, Aprovado Não Classificado ou Reprovado. |
| RN06 | O gestor pode registrar o parecer textual apenas após o envio do avaliador. |
| RN07 | A submissão do projeto só será possível dentro do prazo definido no edital. |
| RN08 | O sistema deve garantir que o mesmo CPF não possa ser usado em dois cadastros de pesquisadores. |

---

## 4. Stakeholders

| Stakeholder | Papel no Sistema |
|-------------|-----------------|
| Pesquisador | Realiza pré-cadastro, submete projetos e edita dados. |
| Gestor | Publica editais, aprova cadastros, define avaliadores e finaliza avaliações. |
| Avaliador | Analisa projetos e emite parecer. |
| Administrador de TI | Responsável pela manutenção técnica, segurança e funcionamento do sistema. |
| Instituição de Ensino/Pesquisa | Organização promotora do edital e supervisora dos projetos. |
| Desenvolvedores | Responsáveis pelo desenvolvimento e manutenção do sistema. |
