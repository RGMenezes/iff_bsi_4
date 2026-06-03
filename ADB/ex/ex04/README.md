# Exercício

### A imobiliaria ABC mantém um banco de dados relativo aos imóveis que possui. Cada imóvel
possui um corretor responsável. Os imóveis podem ser reservados para os clientes.

1. Crie o banco de dados e as tabelas conforme o modelo. Crie índices para as chaves
estrangeiras e defina as restrições de integridade das tabelas para atender aos requisitos
a seguir:
  - a) Se endereço de um imóvel for excluído, o SGBD deve setar a referência desse
      endereço na tabela imóvel para null.
  - b) O cadastro de um corretor não pode ser excluído se houver imóveis sob sua
      responsabilidade.
  - c) Se um imóvel for excluído as reservas associadas a ele também devem ser
      excluídas.
  - d) Se um cliente que possui reservas for excluído todas as suas reservas também
      devem ser excluídas.

2. Insira dados nas tabelas;

3. Faça exclusões de forma a validar a restrições de integridade definidas;
